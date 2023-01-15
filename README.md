# 💰 - Money Wash (QBCore)

MLO - https://www.gta5-mods.com/maps/abandoned-laundromat-interior-singleplayer-fivem-gtadps (Optional can be changed :))

Customizable Money Wash!

Allow players in your server to wash there money. The script requries qb core, ox_lib it runs at 0.00ms. The script works by choosing a amount of money you want to wash then it will wash the money and give you back the money you washed minus the tax which is configurable.


Script Preview: https://cdn.discordapp.com/attachments/1028468347278458951/1063517929632698389/2023-01-13_11-59-01.mp4
Edit QB-Core > Config.lua
```lua
QBConfig.Money.MoneyTypes = { cash = 500, bank = 5000, crypto = 0, blackmoney = 0 } -- type = startamount - Add or remove money types for your server (for ex. blackmoney = 0), remember once added it will not be removed from the database!
```
