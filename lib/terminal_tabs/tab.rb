class Tab
    attr_accessor :name, :directive
    
    def initialize(name, directive)
      self.name = name
      self.directive = directive
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
end
