module Plugins
  class ListOrganizations
    def initialize
      # Any magic preparations needed go here
    end

    def self.info
      plugin = Hash.new
      plugin['name']        = 'list_organizations'
      plugin['author']      = 'lukaszraczylo'
      plugin['handle']      = 'list_organizations'
      plugin['description'] = 'List all the github organizations your account belongs to'
      plugin['type']        = 'boolean'
      return plugin
    end

    def self.run
      # This is the main method executed on plugin run
      $orgs = Array.new
      max_width = 0
      $connection.organizations.each do |org|
        org.url.length <= max_width ? max_width : max_width = org.url.length
        $orgs.push(:name => org.login, :github_id => org.id, :github_url => org.url.gsub('api.', ''))
      end
      tp.set :max_width, max_width
      tp $orgs
    end
  end
end