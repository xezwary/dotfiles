--[[
  * boss-key.lua v1.0.2
  * (Older versions will lack a version number)
  *
  * AUTHOR: detuur, zaza42
  * License: MIT
  * link: https://github.com/detuur/mpv-scripts
  * 
  * This script minimises and pauses the window when
  * the boss key (default 'b') is pressed.
  * Can be overwriten in input.conf as follows:
  * KEY script-binding boss-key
  * xdotool is required on Xorg(Linux)
--]]

utils = require 'mp.utils'

function boss_key()
	mp.set_property_native("pause", true)
	utils.subprocess({ args = {'xdotool', 'getactivewindow', 'windowminimize'} })
end

mp.add_key_binding('b', 'boss-key', boss_key)
