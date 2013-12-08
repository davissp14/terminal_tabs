require 'yaml'

ROOT_PATH =  File.expand_path("../../", __FILE__)
Dir[File.join(ROOT_PATH, "lib/terminal_tabs/*.rb")].each {|f| require f }

class Terminal
  TABS_PATH = "#{ROOT_PATH}/tabs.yml"
  OUTPUT_PATH = ROOT_PATH
  OUTPUT_FILE = "autorun.sh"
  OUTPUT_TO = "#{OUTPUT_PATH}/#{OUTPUT_FILE}"
end
