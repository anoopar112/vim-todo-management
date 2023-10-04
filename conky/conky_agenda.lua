--[[
#=================================================
# Author  : Anoop Reghuvaran
#=================================================
]]

dofile("./conkyrc_common.lua")

conky.config["alignment"] = "bottom_right"
conky.config["gap_x"] = 30
conky.config["gap_y"] = 220
conky.config["minimum_height"] = 360

-- [[
-- # replace the paths here.
-- ]]
conky.text = [[
${voffset 0}${offset 0}${font1}AGENDA ${hr 2}
${execpi 6  ./parseAgenda -f ~/Documents/vimwiki/todo}

]]
