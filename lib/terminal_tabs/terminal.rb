class Terminal
  attr_accessor :type, :file_tabs

  def initialize
    self.type = nil
    self.file_tabs = []
  end

  def build_executable
    self.file_tabs.each do |filename, hash|
      File.open("#{OUTPUT_PATH}/#{filename}.sh", 'w') do |file|
        file.write(
          %Q[osascript <<-eof
           tell application "Iterm"
             activate
        	 -- make new terminal
        	 set myterm to (current terminal)
             -- tell the terminal to do something
             tell myterm
               #{generate_tabs(hash)}
             end tell
           end tell
        eof]
        )
        file.chmod(0755)
        puts "#{Terminal::OUTPUT_PATH}/#{filename}.sh has been created!"
      end
    end
  end
  
  def generate_tabs(hash)
    source = ''
    hash.each do |name, cmd|
      tab = Tab.new(name, cmd)
      source << tab.build
    end
    source
  end

  def load_tabs
    if File.exists?(TABS_PATH)
      contents = YAML.load_file(TABS_PATH)
      self.type = contents["terminal"]
      self.file_tabs = contents["tabs"]
      abort("No tabs found at: #{TABS_PATH}") if self.file_tabs.empty?
    else
      abort("#{TABS_PATH} does not exist...")
    end
  end

end
