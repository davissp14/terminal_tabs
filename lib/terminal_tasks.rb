require 'yaml'
require_relative 'terminal_tasks/tab'
require_relative 'terminal_tasks/terminal'


class Terminal
  TASKS_PATH = "../tasks.yml"
  OUTPUT_PATH = "../"
  OUTPUT_FILE = "autorun.sh"
  OUTPUT_TO = "#{OUTPUT_PATH}/#{OUTPUT_FILE}"
end
