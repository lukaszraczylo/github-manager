# github-manager
Plugins based github account / organisation management framework.

##### Please note that I'm not responsible for any data loss caused by this software. Until version 0.7 it should be considered as 'unstable', so use it at your own risk.

## Installation

Run installer script which will automagically configure everything for you. Can't be simplier I think.

```
installer.sh
```

## Configuration

Only thing it needs from you by default is Github API token. You can obtain it from (github personal access tokens)[https://github.com/settings/tokens] page.

```
export GITHUB_MANAGER_API_TOKEN="<40 characters API token>"
```

Github manager API token should have access rights to user, repo and org management. No worries - ghm won't change anything without your knowledge.

## Plugins

All the plugins you want to use should be added to active-plugins directory.
If you'd like to use one of 'stock' plugins simply symlink it there to stay up to date.