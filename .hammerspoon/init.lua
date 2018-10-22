-- http://www.hammerspoon.org/go/

-- 画面全部
hs.hotkey.bind({"alt", "shift"}, "K", function()
  moveWindow(function(f, max)
    f.x = 0
    f.y = 0
    f.w = max.w
    f.h = max.h
  end)
end)

-- 画面左半分
hs.hotkey.bind({"alt", "shift"}, "H", function()
  moveWindow(function(f, max)
    f.x = 0
    f.y = 0
    f.w = max.w / 2
    f.h = max.h
  end)
end)

-- 画面右半分
hs.hotkey.bind({"alt", "shift"}, "L", function()
  moveWindow(function(f, max)
    f.x = max.w / 2
    f.y = 0
    f.w = max.w / 2
    f.h = max.h
  end)
end)

-- 画面中央1/3
hs.hotkey.bind({"alt", "shift", "ctrl"}, "K", function()
  moveWindow(function(f, max)
    f.x = max.w / 3
    f.y = 0
    f.w = max.w / 3
    f.h = max.h
  end)
end)

-- 画面左1/3
hs.hotkey.bind({"alt", "shift", "ctrl"}, "H", function()
  moveWindow(function(f, max)
    f.x = 0
    f.y = 0
    f.w = max.w / 3
    f.h = max.h
  end)
end)

-- 画面右1/3
hs.hotkey.bind({"alt", "shift", "ctrl"}, "L", function()
  moveWindow(function(f, max)
    f.x = max.w * 2 / 3
    f.y = 0
    f.w = max.w / 3
    f.h = max.h
  end)
end)

-- 画面左2/3
hs.hotkey.bind({"alt", "shift", "ctrl", "cmd"}, "H", function()
  moveWindow(function(f, max)
    f.x = 0
    f.y = 0
    f.w = max.w * 2 / 3
    f.h = max.h
  end)
end)

-- 画面右2/3
hs.hotkey.bind({"alt", "shift", "ctrl", "cmd"}, "L", function()
  moveWindow(function(f, max)
    f.x = max.w / 3
    f.y = 0
    f.w = max.w * 2 / 3
    f.h = max.h
  end)
end)

function moveWindow(cb)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  cb(f, max)
  win:setFrame(f)
end
