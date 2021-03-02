-------------------------------------------------
-- Spotify Shell for Awesome Window Manager
-- Simplifies interaction with Spotify for Linux
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/spotify-shell

-- @author Pavel Makhov
-- @copyright 2018 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local gears = require("gears")

local ICON = '/usr/share/icons/Papirus-Light/32x32/apps/spotify-linux-48x48.svg'

local spotify_shell = awful.widget.prompt()

local w = wibox {
    bg = '#381957',
    border_width = 1,
    border_color = '#dcc1f7',
    max_widget_size = 500,
    ontop = true,
    height = 25,
    width = 500,
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, height / 2)
    end
}

w:setup {
    {
        {
            image = ICON,
            widget = wibox.widget.imagebox,
            resize = true
        },
        id = 'icon',
        top = 0,
        left = 0,
        layout = wibox.container.margin
    },
    {
        layout = wibox.container.margin,
        left = 15,
        spotify_shell,
    },
    id = 'left',
    layout = wibox.layout.fixed.horizontal
}

local function launch()
    w.visible = true

    awful.placement.top(w, { margins = {top = 1020}, parent = awful.screen.focused()})
    awful.prompt.run{
        prompt = "<b>Spotify</b>: ",
        bg_cursor = '#cb96ff',
        textbox = spotify_shell.widget,
        history_path = gfs.get_dir('cache') .. '/spotify_history',
        exe_callback = function(input_text)
            if not input_text or #input_text == 0 then return end
            awful.spawn("sp " .. input_text)
        end,
        done_callback = function()
            w.visible = false
        end
    }
end

return {
    launch = launch
}
