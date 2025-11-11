local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- For Windows
--config.default_prog = { 'pwsh.exe', '-NoLogo' }
--config.default_domain = 'WSL:Ubuntu'

config.font = wezterm.font_with_fallback({ -- fonts
	'MesloLGS Nerd Font Mono',
	'Hack FC Ligatured'
	"UbuntuMono Nerd Font Mono"	
})

config.enable_tab_bar = false 			-- enable/disable tabs
config.font_size = 17 				-- font size
config.window_background_opacity = 0.95 	-- opacity
config.color_scheme = "Catppuccin Mocha" 	-- color scheme
config.line_height = 1.1 			-- line height
config.window_close_confirmation = "NeverPrompt"	-- No prompt on exit

-- config.window_decorations = "RESIZE" -- enable/disable window bar
-- config.window_background_image = "/home/rjorge99/wallpapers/groot.jpg"


return config
