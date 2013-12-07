class Generate
  attr_reader :app, :tasks

  def initialize
    @tasks = {}
    @app = ''
    load_yml
  end

  def load_yml    
    yml_contents = YAML.load_file("./tasks.yml")
    raise "No tasks.yml file detected" unless yml_contents
    @tasks = symbolize_keys!(yml_contents["tasks"] || {})
    raise "No tasks detected..." unless @tasks
    @app = yml_contents["terminal"] || 'iTerm'
  end
  
  def generate_tabs    
    str = ''
    @tasks.each do |task|
      tab = Tab.new(Hash[*task])
      str << tab.generate_tab
    end
    str
  end

  def generate_autorun
    File.open('./autorun.sh', 'w') do |file|
      file.write(
        %Q[osascript <<-eof
           tell application "#{@app}"
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
  
  private 
  
  def symbolize_keys!(hash)
    raise "Not a hash!" unless hash.is_a?(Hash)
    hash.inject({}){|mkey,(k,v)| mkey[k.to_sym] = v; mkey}
  end
end