fx_version 'cerulean'
game 'gta5'

author 'Mads'
description 'Licenses'

client_scripts {
	'config.lua',
	'client.lua'
}

server_scripts { 
	'server.lua', 
	'example.lua' 
}

ui_page('html/index.html')

files({
	'html/index.html',
	'html/script.js',
	'html/style.css',
	'html/images/*.png',
	'html/fonts/franklingothicdemi/Franklin-Gothic-Demi-Regular.woff',
	'html/fonts/justsignature/JustSignature.woff'
})
