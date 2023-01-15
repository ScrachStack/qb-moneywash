-- JOIN FOR SUPPORT https://discord.gg/qRQ5f5rdmN

fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kezi'
description 'Money Wash Script'
version '1.0.1'

server_scripts { 
    "server/*",
}

client_scripts { 
    "client/*",
}

shared_scripts { 'config.lua', '@ox_lib/init.lua'
}

escrow_ignore {
    'server/*',
    'client/*',
    'config.lua',
  }
  