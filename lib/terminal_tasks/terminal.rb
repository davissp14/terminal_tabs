class Terminal
  attr_accessor :type, :tasks

  def initialize
    load_yml

  rescue NoTasksDetected
    $stderr.puts("No tasks.yml file detected")
  rescue TasksFileNotFound
    $stderr.puts("No tasks detected...")
  rescue
    $stderr.puts($!)
  end

  def build_file
    File.open(OUTPUT_TO, 'w') do |file|
      file.write(
        %Q[osascript <<-eof
           tell application "Iterm"
             activate
        	 -- make new terminal
        	 set myterm to (current terminal)
             -- tell the terminal to do something
             tell myterm
               #{generate_tabs}
             end tell
           end tell
        eof]
      )
      file.chmod(0755)
    end
  end
  
  def generate_tabs
    source = ''
    self.tasks.each do |task|
      tab = Tab.new(Hash[*task])
      puts "Generating #{tab.name}"
      source << tab.build
    end
    source
  end

  
  private

  def load_yml
    yml_contents = YAML.load_file(TASKS_PATH)
    raise TasksFileNotFound unless yml_contents
    self.tasks = symbolize_keys!(yml_contents["tasks"] || {})
    raise NoTasksDetected unless self.tasks
    self.type = yml_contents["terminal"] || 'iTerm'
  end
  
  def symbolize_keys!(hash)
    raise "Not a hash!" unless hash.is_a?(Hash)
    hash.inject({}){|mkey,(k,v)| mkey[k.to_sym] = v; mkey}
  end
end

class TasksFileNotFound < StandardError; end
class NoTasksDetected < StandardError; end