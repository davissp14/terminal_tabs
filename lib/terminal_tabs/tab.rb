class Tab
    attr_accessor :tab, :name, :directive
    
    def initialize(tab={})
      self.tab = tab
      self.name = tab_name.to_s
      self.directive = tab_directive
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

    def tab_name
      self.tab.keys.first
    end

    def tab_directive
      self.tab[tab_name]
    end
end
