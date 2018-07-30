#!/usr/bin/env ruby

require 'optparse'
require 'terminal-table'
require 'colorize'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: #{$0} [options]"
  opts.on("-t", "--title \"Setup CI\"", String, "Title") { |a| options[:title] = a }
  opts.on("-a", "--actions build,test,deploy", Array, "Array of actions") { |a| options[:actions] = a }
  opts.on("-s", "--status success,success,error", Array, "Array of status") { |a| options[:status] = a }
end.parse!
raise OptionParser::MissingArgument.new('action') if options[:actions].nil?
raise OptionParser::MissingArgument.new('status') if options[:status].nil?
raise OptionParser::InvalidOption.new('actions and status options must have the same number of element') if options[:actions].count != options[:status].count
rows = options[:actions].map.with_index { | action, index |
	status = options[:status][index]
	if (status == "error")
		action = "💥 #{action}".red
	end
	[ index, action ]
}
table = Terminal::Table.new :title => options[:title], :headings => ['Step', 'Action'], :rows => rows
puts table