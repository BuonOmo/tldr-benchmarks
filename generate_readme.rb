HYPERFINE_OUTPUT = 'test/fixtures/hyperfine.json'
UPDATE_TIMES = 'test/fixtures/update_times.csv'
INFO = 'information.tsv'

require 'csv'
require 'erb'
require 'json'
require 'stringio'

def last_commit_time(git_link)
	@last_commit_times ||= {}
	return @last_commit_times[git_link] if @last_commit_times[git_link]

	temp_folder = 'tldr-benchmarks-temp'

	commit_time =
		`
		git clone --quiet #{git_link} #{temp_folder}
		cd #{temp_folder}
		git log -1 --pretty=format:"%ar"
		cd ..
		rm -rf #{temp_folder}
		`.chomp

	@last_commit_times[git_link] = commit_time
end

def generate_table(hyperfine_output_path, hyperfine_update_path, update_times_path, information_path, stream = $stdout, extra_rows = [])
	results = JSON.load_file(hyperfine_output_path)['results']
	results_update = JSON.load_file(hyperfine_update_path)['results']
	info = CSV.read(information_path, col_sep: "\t", headers: true).to_h { [_1['command'], _1] }
	update_times = CSV.read(update_times_path).to_h

	headers = ["Client","Language", "Time to show `tar` page (mean ± σ)", "Time to Generate Cache", "Time to check for cache update (mean ± σ)", "Last Commit", *extra_rows.map(&:first)]

	rows = results.map do |result|
		command = result['command'][%r( \./(.*) tar), 1]
		update = results_update.find { _1['command'][command] }
		info_row = info[command]
		update_times[command][/(\d+)m(\d+)\.(\d+)s/]
		update_time = "%02d:%02d.%d" % [$1.to_i, $2.to_i, $3.to_i]
		[
			"[#{command}](#{info_row['git link']})",
			info_row['lang'],
			"#{(result['mean'] * 1_000).round(1)} ms ± #{(result['stddev'] * 1_000).round(1)}",
			update_time,
			"#{(update['mean'] * 1_000).round(1)} ms ± #{(update['stddev'] * 1_000).round(1)}",
			last_commit_time(info_row['git link']),
			*extra_rows.map { _2.call(command, result, info_row, update_time) },
		]
	end

	rows.sort_by! { |row| row[2] }
	col_widths = headers.zip(*rows).map { |cols| cols.map { _1.to_s.length }.max }

	stream.puts "| #{headers.zip(col_widths).map { _1.to_s.ljust(_2, ' ') }.join(' | ')} |"
	stream.puts "| #{col_widths.map { '-' * _1 }.join(' | ')} |"
	rows.each do |row|
		stream.puts "| #{row.zip(col_widths).map { _1.to_s.ljust(_2, ' ') }.join(' | ')} |"
	end
end

io = StringIO.new
generate_table(*ARGV[0, 3], 'information.tsv', io, [
	["Comment", ->(_, _, info, _) { info['comment mac'] }]
])
mac_table = io.string

io = StringIO.new
generate_table(*ARGV[3, 3], 'information.tsv', io, [
	["Comment", ->(_, _, info, _) { info['comment ubuntu'] }]
])
ubuntu_table = io.string

File.write('README.md', ERB.new(DATA.read).result(binding))

__END__
# TLDR Benchmarks

A collection of benchmarks for the various TLDR implementations.

These benchmarks aim to provide a comparison for one who wants to
choose an implementation based on overall performance, installation
time and project maintenance.

## For Mac OS X

<%= mac_table %>

## For Ubuntu

<%= ubuntu_table %>
