local powermenu = "eww open powermenu"
local spotify_client = "cd " .. os.getenv("HOME") .. "/.config/eww/spotify && npm run start"
local notification_client = "dunst"

hl.on("hyprland.start", function()
	hl.exec_cmd(powermenu)
	hl.exec_cmd(spotify_client)
        hl.exec_cmd("systemctl --user start hyprpaper")
	hl.exec_cmd(notification_client)
end)

hl.on("config.reloaded", function()
	hl.exec_cmd("killall eww && " .. powermenu)
        hl.exec_cmd("systemctl --user restart hyprpaper")
	hl.exec_cmd(spotify_client)
	hl.exec_cmd("killall " .. notification_client .. " && " .. notification_client)
end)
