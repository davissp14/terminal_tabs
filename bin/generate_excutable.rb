require_relative '../lib/terminal_tabs.rb'

term = Terminal.new
term.build_file
puts "#{Terminal::OUTPUT_FILE} has been created!"