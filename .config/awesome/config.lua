local gfilesystem = require('gears.filesystem')

local config = {}
local terminal = 'alacritty'
local terminal_execute = terminal .. ' -e '

config.wm = {
  name = 'awesome',
}
config.places = {}
config.features = {}
config.apps = {
  shell = 'fish',
  terminal = terminal,
  editor = terminal_execute .. 'nvim',
  browser = 'firefox',
  private_browser = 'firefox --private-window',
  mixer = terminal_execute .. 'pulsemixer',
  bluetooth_control = terminal_execute .. 'bluetoothctl',
}
config.power = {}
config.actions = {}
config.commands = {}

-- local awful_utils = require('awful.util')
-- awful_utils.shell = config.apps.shell

return config
