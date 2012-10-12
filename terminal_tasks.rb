require 'yaml'

require './terminal_tasks/tab'
require './terminal_tasks/generate'

Generate.new.generate_autorun
puts "Autorun.sh successfully generated!!!"