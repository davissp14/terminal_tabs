class Generate
  attr_reader :autos

  def initialize
    @cmds = {}
    @terminal = ''
    load_yml
  end

  def load_yml    
    yml_contents = YAML.load_file("./autoload.yml")
    raise "No autoload.yml file detected" unless yml_contents
    @cmds = symbolize_keys!(yml_contents["autoloads"] || {})
    raise "No autoloads detected..." unless @cmds
    @terminal = yml_contents["terminal"] || 'iTerm'
    puts "No terminal defined... Defaulting to \"iTerm\"" unless @terminal
  end
  
  def generate_tabs    
    str = ''
    @cmds.each do |cmd|
      tab = Tab.new(Hash[*cmd])
      str << tab.generate_tab
    end
    str
  end

  def generate_script
    File.open('./autorun.sh', 'w') do |file|
      file.write(
        %Q[osascript <<-eof
           tell application "#{@terminal}"
        	   -- make new terminal
        	   tell the front terminal
      	  	   activate current session
               #{generate_tabs}
             end tell
           end tell
           tell application "#{@terminal}"
             activate
           end tell
      eof]
      )
     file.chmod(0755)
    end
  end
  
  private 
  
  def symbolize_keys!(hash)
    raise "Not a hash!" unless hash.is_a?(Hash)
    hash.inject({}){|mkey,(k,v)| mkey[k.to_sym] = v; mkey}
  end
  
end