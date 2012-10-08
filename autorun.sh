osascript <<-eof
           tell application "iTerm"
        	   -- make new terminal
        	   tell the front terminal
      	  	   activate current session
                       launch session "Default Session"
        tell the current session
          write text "coffee /Users/shaun/Programming/mongohq/probe-server/local_runner.coffee"
        end tell
        launch session "Default Session"
        tell the current session
          write text "coffee /Users/shaun/Programming/mongohq/probe-server/scripts/pusher_relay.coffee"
        end tell

             end tell
           end tell
           tell application "iTerm"
             activate
           end tell
      eof