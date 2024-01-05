local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c):setup({
		{ -- Left
			{
				wibox.layout.margin(awful.titlebar.widget.iconwidget(c), dpi(2), dpi(5), dpi(5), dpi(5)),
				layout = wibox.layout.fixed.horizontal(),
			},
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{ -- Middle
			{ -- Title
				align = "left",
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal,
		},
		{ -- Right
			wibox.layout.margin(awful.titlebar.widget.floatingbutton(c), dpi(2), dpi(5), dpi(5), dpi(5)),
			wibox.layout.margin(awful.titlebar.widget.maximizedbutton(c), dpi(2), dpi(5), dpi(5), dpi(5)),
			wibox.layout.margin(awful.titlebar.widget.minimizebutton(c), dpi(2), dpi(5), dpi(5), dpi(5)),
			wibox.layout.margin(awful.titlebar.widget.closebutton(c), dpi(2), dpi(5), dpi(5), dpi(5)),
			layout = wibox.layout.fixed.horizontal(),
		},
		layout = wibox.layout.align.horizontal,
	})
end)
