class Tab
    attr_reader :task, :name, :directive
    
    def initialize(task={})
      @task = task
      @name = task_name.to_s
      @directive = task_directive
    end

    def generate_tab
      <<-eof
        launch session "Default Session"
        tell the current session
          write text "#{@directive}"
        end tell 

        set mysession to the last session
        tell the last session
          set name to "#{@name}"
        end tell
      eof
    end

    def task_name
      @task.keys.first
    end

    def task_directive
      @task[task_name]
    end
end
