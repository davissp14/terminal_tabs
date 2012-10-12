# Terminal Tasks

Specify what you want to run in your terminal tabs, and this script will build your workstation for you.

*** Currently only compatible with Iterm.

## tasks.yml

 Specify tasks to be opened and executed in a separate terminal tabs.
  
   Examples:

      `mysql: "/usr/local/bin/mysql"`

      `rails_server: "cd /Users/user/Programming/rails_project/ && rails s"`
     


  To generate an executable to run your tasks simply run:

   `ruby terminal_jobs.rb`

  A autorun.sh file will be generated and can be moved anywhere you like.


## Recommendation:
   
     Move the autorun.sh file to a fixed directory, and create an alias to run that script.

     Steps on creating an alias:

     1. `vim ~/.bash_profile`

     2. `alias autorun='./path/to/file'`

     3. `:wq`

     4. `source ~/.bash_profile`


