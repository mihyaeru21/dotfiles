local wezterm = require('wezterm')
local config = {}

config.font = wezterm.font_with_fallback { 'Bizin Gothic Discord NF' }
config.font_size = 12.0
config.underline_thickness = 1
config.underline_position = -2
config.color_scheme = 'nightfox'
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.unicode_version = 14

wezterm.on('toggle-opacity', function(window, _)
  local overrides = window:get_config_overrides() or {}
  if overrides.window_background_opacity == 1.0 then
    overrides.window_background_opacity = 0.95
  else
    overrides.window_background_opacity = 1.0
  end
  window:set_config_overrides(overrides)
end)

local act = wezterm.action
config.keys = {
  { key = 'c', mods = 'ALT',        action = act.CopyTo('Clipboard') },
  { key = 'v', mods = 'ALT',        action = act.PasteFrom('Clipboard') },
  { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },
  { key = 't', mods = 'ALT',        action = act.SpawnTab('CurrentPaneDomain') },
  { key = 'u', mods = 'ALT',        action = act.EmitEvent('toggle-opacity'), },
}

return config
