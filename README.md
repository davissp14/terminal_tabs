# Terminal Tabs

Terminal tabs makes it super easy to quickly build out your terminal workstation.

### Supported Terminals ##
 * Iterm2

## Installation
      git clone git@github.com:davissp14/terminal_tabs.git

## Getting started
      
 Declare your desired executable name and tabs using the tabs.yml file 
        
        tabs: 
          rails_project:  # Name of executable 
            rails_logs: "tail -f /Users/user/Programming/rails_project/log/development.log"  # Format (tab_name: cmd)
            rails_server: "cd /Users/user/Programming/rails_project/ && rails s"             # Format (tab_name: cmd)
 
 Generate an executable thats capable of building out your workstation.
          
        $ ruby bin/generate_excutable.rb

 Create an alias in your bash profile that points to the file, or just simply run it.   
 
        $ ./autorun.sh   




##License

(The MIT License)

Copyright (c) 2009-2012 TJ Holowaychuk <tj@vision-media.ca>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.





