require 'yaml'

require './terminal_jobs/tab'
require './terminal_jobs/generate'

Generate.new.generate_autorun
puts "Autorun.sh successfully generated!!!"