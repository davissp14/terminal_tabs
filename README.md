# Terminal Tabs

Terminal tabs makes it super easy to quickly build out your terminal workstation.

### Supported Terminals ##
Currently the only supported terminal is Iterm2.  


### Getting started

      1. git clone git@github.com:davissp14/terminal_tabs.git
      
      2. Define your tabs using the tabs.yml file 

      3. ruby bin/generate_excutable.rb

      4. ./autorun.sh   



### tabs.yml

Specify your tabs in the following format:
  
   Example:
   
      tabs: 
        rails_logs: "tail -f /Users/user/Programming/rails_project/log/development.log"
        rails_server: "cd /Users/user/Programming/rails_project/ && rails s"
        
      
     



