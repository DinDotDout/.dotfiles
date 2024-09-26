local wezterm = require 'wezterm'

local color_default_fg_light = wezterm.color.parse("#cacaca") -- 💩
local color_default_fg_dark = wezterm.color.parse("#303030")

return {
  VERIDIAN = {
    bg = wezterm.color.parse("#4D8060"),
    fg = color_default_fg_light
  },
  PAYNE = {
    bg = wezterm.color.parse("#385F71"),
    fg = color_default_fg_light
  },
  JET = {
    bg = wezterm.color.parse("#282B28"),
    fg = color_default_fg_light
  },
  ECRU = {
    bg = wezterm.color.parse("#C6AE82"),
    fg = color_default_fg_dark
  },
}
