-- 設定ファイルでよく使いそうな関数を置いておく

local io = require('io')
local string = require('string')

local M = {};

M.contain_str_in_line = function(path, str)
  for line in io.lines(path) do
    if string.find(line, str, 1, true) then
      return true
    end
  end
  return false
end

return M

