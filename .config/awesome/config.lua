-- DEPENDENCIES (see below)

local gfilesystem = require("gears.filesystem")


local config = {}

config.features = {
    screenshot_tools = false,
    magnifier_tools = false,
    torrent_widget = false,
    weather_widget = false,
    redshift_widget = false,
    wallpaper_menu = false,
}

config.places = {}
config.places.home = os.getenv("HOME")
config.places.config = os.getenv("XDG_CONFIG_HOME") or (config.places.home .. "/.config")
config.places.awesome = string.match(gfilesystem.get_configuration_dir(), "^(/?.-)/*$")
config.places.theme = config.places.awesome .. "/theme"
config.places.screenshots = config.places.home .. "/Pictures/Screenshots"
config.places.wallpapers = config.places.home .. "/Pictures/Wallpapers"

config.wm = {
    name = "awesome",
}

local terminal = "alacritty"
local terminal_execute = terminal .. " -e "

config.apps = {
    shell = "fish",
    terminal = terminal,
    editor = terminal_execute .. "nvim",
    browser = "firefox",
    private_browser = "firefox --private-window",
    file_manager = terminal_execute .. "ranger",
    calculator = "speedcrunch",
    mixer = terminal_execute .. "pulsemixer",
    bluetooth_control = terminal_execute .. "bluetoothctl",
    -- music_player = "spotify",
    -- video_player = "freetube",
}

config.power = {
    shutdown = "systemctl poweroff",
    reboot = "systemctl reboot",
    suspend = "systemctl suspend",
    kill_session = "loginctl kill-session ''",
    lock_session = "loginctl lock-session",
    lock_screen = "light-locker-command --lock",
}

config.actions = {
    qr_code_clipboard = "qrclip",
    show_launcher = "rofi -show drun",
    show_emoji_picker = config.places.config .. "/rofi/emoji-run.sh",
}

config.commands = {}

function config.commands.open(path)
    return "xdg-open \"" .. path .. "\""
end

function config.commands.copy_text(text)
    return "echo -n \"" .. text .. "\" | xclip -selection clipboard"
end


local awful_utils = require("awful.util")
awful_utils.shell = config.apps.shell

return config
