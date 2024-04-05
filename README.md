## Code Redeem

This script will validate and redeem the content from cfx-server-manager codes. 

## Dependencies

In order to use this script you will need the cfx-server-manager resource, where you will have to be located on a valid domain in addition to having completed the entire installation process.

Resource link: [Website script](https://github.com/Xavimc04/cfx-server-manager.git)

## Setup 

1. Clone the repository 

```
git clone https://github.com/Xavimc04/code-redeem.git
```

2. Drop the script into your server resources
3. Create config file

```
config.lua
```

4. Complete config data

```lua
local WEBSITE_URL = "https://xaviermorell.es"
local WEBSITE_SECRET = "INTRODUCE_YOUR_SECRET_HERE"
```

## Author

Xavier Morell