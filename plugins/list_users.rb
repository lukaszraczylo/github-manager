module Plugins
  class ListUsers
    def initialize
      # Any magic preparations needed go here
    end

    def self.info
      plugin = Hash.new
      plugin['name']        = 'list_users'
      plugin['author']      = 'lukaszraczylo'
      plugin['handle']      = 'list_users'
      plugin['description'] = 'List all the github users within all org'
      plugin['type']        = 'boolean'
      return plugin
    end

    def self.run
      # This is the main method executed on plugin run
      puts "running listusers here"
    end
  end
end