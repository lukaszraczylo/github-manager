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
      $users_data = Array.new
      i         = 1
      max_width = 0
      $connection.organizations.each do |org|
        begin
          $connection.organization_members(org.login, :per_page => 200).each do |m|
            m.html_url.length <= max_width ? max_width : max_width = m.html_url.length
            $users_data.push(:id => i, :organization => org.login, :login => m.login, :github_id => m.id, :profile_url => m.html_url)
            i += 1
          end
        rescue Octokit::NotFound
          Printer.print("warn", "Can't list members for this organisation. Insufficient permissions?")
        end
      end
      tp.set :max_width, max_width
      tp $users_data
    end
  end
end