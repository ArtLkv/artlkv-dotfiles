local config = require("config")

local services = {
    volume = require("services.volume"),
    torrent = config.features.torrent_widget and require("services.torrent") or nil,
    wallpaper = config.features.wallpaper_menu and require("services.wallpaper") or nil,
    power = require("services.power"),
    media = require("services.media"),
}

for _, service in pairs(services) do
    if type(service.watch) == "function" then
        service.watch()
    end
end

return services
