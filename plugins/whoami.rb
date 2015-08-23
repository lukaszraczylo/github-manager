module Plugins
  class Whoami
    def initialize
      # Any magic preparations needed go here
    end

    def self.info
      plugin = Hash.new
      plugin['name']        = 'whoami'
      plugin['author']      = 'lukaszraczylo'
      plugin['handle']      = 'whoami'
      plugin['description'] = 'Print information about myself'
      plugin['type']        = 'boolean'
      return plugin
    end

    def self.run
      # This is the main method executed on plugin run
      return "#{$connection.user.name} (#{$connection.user.login})"
    end
  end
end