class Tab
    attr_reader :job, :cmd, :name, :directive
    
    def initialize(job={})
      @job = job
      @cmd = command
      @name = job_name.to_s
      @directive = job_directive
    end

    def generate_tab
      <<-eof
        launch session "Default Session"
        tell the current session
          write text "#{@cmd} #{@directive}"
        end tell
      eof
    end

    def command
      match = job_directive.match(/\.(.*)/)
      match ? match[1] : ''
    end

    def job_name
      @job.keys.first
    end

    def job_directive
      @job[job_name].to_s
    end
end