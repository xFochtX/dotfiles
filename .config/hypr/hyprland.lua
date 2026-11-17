-- ============================================================
-- HYPRLAND 0.57.1 - CONFIGURACIÓN COMPLETA LUA
-- ============================================================

-- ============================================================
-- PROGRAMAS
-- ============================================================

local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "kitty --hold -e yazi"
local menu = "hyprlauncher"

-- ============================================================
-- MONITORES
-- ============================================================

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- ============================================================
-- VARIABLES DE ENTORNO
-- ============================================================

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- ============================================================
-- CONFIGURACION GENERAL
-- ============================================================

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 2,

		col = {
			active_border = {
				colors = {
					"rgba(33ccffee)",
					"rgba(00ff99ee)",
				},
				angle = 45,
			},
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
	},

	input = {
		kb_layout = "latam",
		kb_variant = "",
		kb_model = "",
		kb_options = "numlock:on",
		kb_rules = "",

		follow_mouse = 1,
		numlock_by_default = true,
		sensitivity = 0.5,

		touchpad = {
			natural_scroll = true,
		},
	},

	cursor = {
		warp_on_monitor_change = true,
	},
})

-- ============================================================
-- ANIMACIONES
-- ============================================================

-- Curvas originales

hl.curve("easeOutQuint", {
	type = "bezier",
	points = {
		{ 0.23, 1 },
		{ 0.32, 1 },
	},
})

hl.curve("easeInOutCubic", {
	type = "bezier",
	points = {
		{ 0.65, 0.05 },
		{ 0.36, 1 },
	},
})

hl.curve("linear", {
	type = "bezier",
	points = {
		{ 0, 0 },
		{ 1, 1 },
	},
})

hl.curve("almostLinear", {
	type = "bezier",
	points = {
		{ 0.5, 0.5 },
		{ 0.75, 1 },
	},
})

hl.curve("quick", {
	type = "bezier",
	points = {
		{ 0.15, 0 },
		{ 0.1, 1 },
	},
})

-- Nueva curva spring
hl.curve("easy", {
	type = "spring",
	mass = 1,
	stiffness = 238.1191,
	damping = 24.21279333,
})

-- Animaciones originales

hl.animation({
	leaf = "global",
	enabled = true,
	speed = 10,
	bezier = "default",
})

hl.animation({
	leaf = "border",
	enabled = true,
	speed = 5.39,
	bezier = "easeOutQuint",
})

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 4.79,
	bezier = "easeOutQuint",
})

hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 4.1,
	bezier = "easeOutQuint",
	style = "popin 87%",
})

hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 1.49,
	bezier = "linear",
	style = "popin 87%",
})

hl.animation({
	leaf = "fadeIn",
	enabled = true,
	speed = 1.73,
	bezier = "almostLinear",
})

hl.animation({
	leaf = "fadeOut",
	enabled = true,
	speed = 1.46,
	bezier = "almostLinear",
})

hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 3.03,
	bezier = "quick",
})

hl.animation({
	leaf = "layers",
	enabled = true,
	speed = 3.81,
	bezier = "easeOutQuint",
})

hl.animation({
	leaf = "layersIn",
	enabled = true,
	speed = 4,
	bezier = "easeOutQuint",
	style = "fade",
})

hl.animation({
	leaf = "layersOut",
	enabled = true,
	speed = 1.5,
	bezier = "linear",
	style = "fade",
})

hl.animation({
	leaf = "fadeLayersIn",
	enabled = true,
	speed = 1.79,
	bezier = "almostLinear",
})

hl.animation({
	leaf = "fadeLayersOut",
	enabled = true,
	speed = 1.39,
	bezier = "almostLinear",
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 1.94,
	bezier = "almostLinear",
	style = "fade",
})

hl.animation({
	leaf = "workspacesIn",
	enabled = true,
	speed = 1.21,
	bezier = "almostLinear",
	style = "fade",
})

hl.animation({
	leaf = "workspacesOut",
	enabled = true,
	speed = 1.94,
	bezier = "almostLinear",
	style = "fade",
})

hl.animation({
	leaf = "zoomFactor",
	enabled = true,
	speed = 7,
	bezier = "quick",
})

-- ============================================================
-- DISPOSICION DE VENTANAS
-- ============================================================

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

-- ============================================================
-- INPUT Y TOUCHPAD
-- ============================================================

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "*touchpad",
	sensitivity = 0,
	scroll_factor = 0.5,
})

-- ============================================================
-- AUTOSTART
-- ============================================================

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("mako")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hyprlauncher -d")
end)

-- ============================================================
-- ATAJOS DE TECLADO
-- NO CAMBIAR: CONSERVADOS DE TU CONFIGURACION ORIGINAL
-- ============================================================

-- APLICACIONES

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))

hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))

hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("hyprlauncher"))

-- VENTANAS

hl.bind("SUPER + W", hl.dsp.window.close())

hl.bind("SUPER + M", hl.dsp.exec_cmd("hyprctl dispatch exit"))

hl.bind("SUPER + Q", hl.dsp.exec_cmd("killall waybar"))

hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("waybar"))

hl.bind("SUPER + V", hl.dsp.exec_cmd("hyprctl dispatch togglefloating"))

hl.bind("SUPER + P", hl.dsp.exec_cmd("hyprctl dispatch pseudo"))

hl.bind("SUPER + O", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg togglesplit"))

-- CAPTURA DE PANTALLA

hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("~/dotfiles/.local/bin/hyprshot-kitty.sh"))

-- NAVEGADORES

hl.bind("SUPER + B", hl.dsp.exec_cmd("brave"))

-- BLOQUEO

hl.bind("SUPER + SHIFT + X", hl.dsp.exec_cmd("hyprlock"))

-- SPECIAL WORKSPACE

hl.bind("SUPER + A", hl.dsp.exec_cmd("hyprctl dispatch togglespecialworkspace magic"))

hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace special:magic"))

-- ============================================================
-- MOVIMIENTO ENTRE VENTANAS
-- ============================================================

hl.bind("SUPER + LEFT", hl.dsp.exec_cmd("hyprctl dispatch movefocus l"))

hl.bind("SUPER + RIGHT", hl.dsp.exec_cmd("hyprctl dispatch movefocus r"))

hl.bind("SUPER + UP", hl.dsp.exec_cmd("hyprctl dispatch movefocus u"))

hl.bind("SUPER + DOWN", hl.dsp.exec_cmd("hyprctl dispatch movefocus d"))

-- ============================================================
-- WORKSPACES 1-9
-- ============================================================

for i = 1, 9 do
	-- Cambiar de workspace
	hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))

	-- Mover ventana al workspace
	hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- WORKSPACE 10

hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

-- Mover ventana al workspace 10
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- ============================================================
-- SCROLL ENTRE WORKSPACES
-- ============================================================

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- ============================================================
-- MOVER Y REDIMENSIONAR CON RATON
-- ============================================================

hl.bind("SUPER + mouse:272", hl.dsp.exec_cmd("hyprctl dispatch movewindow"), { mouse = true })

hl.bind("SUPER + mouse:273", hl.dsp.exec_cmd("hyprctl dispatch resizewindow"), { mouse = true })

-- ============================================================
-- VOLUMEN
-- ============================================================

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ repeating = true, locked = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ repeating = true, locked = true }
)

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

-- ============================================================
-- BRILLO
-- ============================================================

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true, locked = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true, locked = true })

-- ============================================================
-- MULTIMEDIA
-- ============================================================

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- ============================================================
-- REGLAS DE VENTANAS
-- ============================================================

-- Picture in Picture de Chrome

hl.window_rule({
	name = "pip-chrome",

	match = {
		title = "^Picture in picture$",
	},

	float = true,
	pin = true,

	no_blur = true,
	no_anim = true,

	-- Nueva regla de Hyprland 0.57
	no_wobble = true,
	no_glow = true,

	size = {
		400,
		225,
	},

	move = {
		"monitor_w*0.7",
		"monitor_h*0.7",
	},
})
