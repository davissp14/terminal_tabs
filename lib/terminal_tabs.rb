require 'yaml'
require 'fileutils'

# Set root path
ROOT_PATH =  File.expand_path("../../", __FILE__)

# Require all files in lib/terminal_tabs
Dir[File.join(ROOT_PATH, "lib/terminal_tabs/*.rb")].each {|f| require f }

# Ensure output_files directory is created
FileUtils.mkdir_p("#{ROOT_PATH}/output_files")

class Terminal
  TABS_PATH = "#{ROOT_PATH}/tabs.yml"
  OUTPUT_PATH = "#{ROOT_PATH}/output_files"
end
