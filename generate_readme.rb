HYPERFINE_OUTPUT = 'test/fixtures/hyperfine.json'
UPDATE_TIMES = 'test/fixtures/update_times.csv'
INFO = 'information.tsv'

require 'csv'
require 'erb'
require 'json'
require 'stringio'

def generate_table(hyperfine_output_path, information_path, update_times_path, stream = $stdout)
	results = JSON.load_file(hyperfine_output_path)['results']
	info = CSV.read(information_path, col_sep: "\t", headers: true).to_h { [_1['command'], _1] }
	update_times = CSV.read(update_times_path).to_h

	headers = ["Client","Language", "Mean (ms)", "Deviation (ms)", "Time to update cache", "Easy to install"]

	rows = results.map do |result|
		command = result['command'][%r( \./(.*) tar), 1]
		info_row = info[command]
		update_times[command][/(\d+)m(\d+)\.(\d+)s/]
		update_time = "%02d:%02d.%d" % [$1.to_i, $2.to_i, $3.to_i]
		[
			"[#{command}](#{info_row['git link']})",
			info_row['lang'],
			(result['mean'] * 1_000).round(1),
			(result['stddev'] * 1_000).round(1),
			update_time,
			info_row['easy to install on mac'],
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
str = StringIO.new
generate_table(ARGV[0], 'information.tsv', ARGV[1], str)
mac_table = str.string

File.write('README.md', ERB.new(DATA.read).result(binding))

__END__
# TLDR Benchmarks

A collection of benchmarks for the various TLDR implementations.

These benchmarks aim to provide a comparison for one who wants to
choose an implementation based on both performance and simplicity.

## For Mac OS X

<%= mac_table %>

## For Ubuntu

Coming soon...
