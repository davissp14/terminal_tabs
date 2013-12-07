require '../lib/terminal_tasks'

term = Terminal.new
term.build_file
puts "#{Terminal::OUTPUT_FILE} has been created!"