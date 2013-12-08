class Terminal
  attr_accessor :type, :tabs

  def initialize
    self.type = nil
    self.tabs = []
  end

  def build_executable
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
      puts "#{Terminal::OUTPUT_FILE} has been created!"
    end
  end
  
  def generate_tabs
    source = ''
    self.tabs.each do |tab|
      tab = Tab.new(Hash[*tab])
      puts "Generating tab: #{tab.name}"
      source << tab.build
    end
    source
  end

  def load_tabs
    if File.exists?(TABS_PATH)
      yml_contents = YAML.load_file(TABS_PATH)
      self.tabs = symbolize_keys!(yml_contents["tabs"] || {})
      abort("No tabs found at: #{TABS_PATH}") if self.tabs.empty?
      self.type = yml_contents["terminal"] || 'iTerm'
    else
      abort("#{TABS_PATH} does not exist...")
    end
  end
  
  def symbolize_keys!(hash)
    raise "Not a hash!" unless hash.is_a?(Hash)
    hash.inject({}){|mkey,(k,v)| mkey[k.to_sym] = v; mkey}
  end
end
