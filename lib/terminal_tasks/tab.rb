class Tab
    attr_accessor :task, :name, :directive
    
    def initialize(task={})
      self.task = task
      self.name = task_name.to_s
      self.directive = task_directive
    end

    def build
      <<-eof
        launch session "Default Session"
        tell the current session
          write text "#{self.directive}"
        end tell 

        set mysession to the last session
        tell the last session
          set name to "#{self.name}"
        end tell
      eof
    end

    private

    def task_name
      @task.keys.first
    end

    def task_directive
      @task[task_name]
    end
end
