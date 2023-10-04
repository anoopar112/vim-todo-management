win_type = "desktop"
local handle = io.popen("echo $XDG_CURRENT_DESKTOP")
local result = string.gsub(handle:read("*a"), "%s+", "")
if result == "KDE" then
	win_type = "dock"
elseif result == "ubuntu:GNOME" then
	win_type = "desktop"
end
handle:close()
conky.config = {

	--Various settings

	background = true,
	cpu_avg_samples = 2,
	diskio_avg_samples = 10,
	double_buffer = true,
	if_up_strictness = "address",
	net_avg_samples = 2,
	no_buffers = true,
	temperature_unit = "celsius",
	update_interval = 1,
	imlib_cache_size = 0,
	xinerama_head = 0,

	--Placement
	minimum_width = 280,
	maximum_width = 280,
	gap_y = 0,
	--Graphical

	border_inner_margin = 10,
	border_outer_margin = 10,
	draw_borders = false,
	draw_graph_borders = true,
	draw_shades = false,
	draw_outline = false,

	--Textual

	format_human_readable = true,
	font = "RobotoMono Nerd Font:size=9:bold",
	font0 = "RobotoMono Nerd Font:size=10:regular",
	font1 = "RobotoMono Nerd Font:size=12:bold",
	font2 = "RobotoMono Nerd Font:size=30:bold",
	font3 = "RobotoMono Nerd Font:size=10:italic",
	max_text_width = 0,
	short_units = true,
	use_xft = true,
	xftalpha = 1,

	--Windows

	own_window = true,
	own_window_argb_visual = true,
	own_window_type = win_type, -- # options are: normal/override/dock/desktop/panel dock for kde,desktop for all others
	own_window_class = "Conky",
	own_window_transparent = true,
	own_window_hints = "undecorated,below,skip_taskbar,sticky,skip_pager",
	own_window_colour = "#131A24",
	-- own_window_colour = "#282c34",
	own_window_argb_value = 250,

	default_color = "#D8DEE9", -- nord4
	-- default_color = "#282c34", -- nord4
	color1 = "#dcdfe4", -- white
	color2 = "#aaaaaa", -- turquiose
	color3 = "#eeeeee", -- blue
	color4 = "#81A1C1", -- nord9
	color5 = "#000000", -- black
	color6 = "#e06c75", -- red
	color7 = "#D08770", -- nord12
	color8 = "#EBCB8B", -- nord13
	color9 = "#98c379", -- green
}
