# Terminal Tasks

Specify what you want to run in your terminal tabs and this script will build your workstation for you.

*** Currently only compatible with Iterm.

## tasks.yml

 Specify tasks to be opened and executed in separate terminal tabs.
  
   Examples:

      mysql: "/usr/local/bin/mysql"

      rails_server: "cd /Users/user/Programming/rails_project/ && rails s"
     


  To generate an executable to run your tasks simply run:

   `ruby terminal_tasks.rb`


## Recommendation:
   
     Move the generated file to a fixed directory and create an alias to execute the file.

     Steps on creating an alias:

     1. `vim ~/.bash_profile`

     2. `alias autorun='./path/to/file'`

     3. `:wq`

     4. `source ~/.bash_profile`


