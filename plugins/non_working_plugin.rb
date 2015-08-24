module Plugins
  class DeadPlugin
    def initialize
      # Any magic preparations needed go here
    end

    def runner
      # This is the main method executed on plugin run
      puts "running whoami"
    end
  end
end