fx_version 'cerulean'
game 'gta5'
 
author 'Xavier Morell || https://wevvi.es'
description 'Redeem codes from @cfx-server-manager repository'

lua54 'yes'
 
server_scripts { 
    'config.lua',
    '@mysql-async/lib/MySQL.lua', 
    'server/**/*.lua'
}