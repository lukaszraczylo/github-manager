# github-manager
Plugins based github account / organisation management framework.

##### Please note that I'm not responsible for any data loss caused by this software. Until version 0.7 it should be considered as 'unstable', so use it at your own risk.

## Installation

Run installer script which will automagically configure everything for you. Can't be simplier I think.

```
installer.sh
```

## Configuration

Only thing it needs from you by default is Github API token. You can obtain it from [github personal access tokens](https://github.com/settings/tokens) page.

```
export GITHUB_MANAGER_API_TOKEN="<40 characters API token>"
```

Github manager API token should have access rights to user, repo and org management. No worries - ghm won't change anything without your knowledge.

## Plugins

All the plugins you want to use should be added to active-plugins directory.
If you'd like to use one of 'stock' plugins simply symlink it there to stay up to date.

We are using [octokit](https://github.com/octokit/octokit.rb) for github operations. There's a connection handler available across the gh-manager ( $connection ).
Blank plugin example ( based on whoami plugin ):

```
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
```