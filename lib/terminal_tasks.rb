require 'yaml'

ROOT_PATH =  File.expand_path("../../", __FILE__)
Dir[File.join(ROOT_PATH, "lib/terminal_tasks/*.rb")].each {|f| require f }

class Terminal
  TASKS_PATH = "#{ROOT_PATH}/tasks.yml"
  OUTPUT_PATH = ROOT_PATH
  OUTPUT_FILE = "autorun.sh"
  OUTPUT_TO = "#{OUTPUT_PATH}/#{OUTPUT_FILE}"
end
