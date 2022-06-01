-- 設定ファイルでよく使いそうな関数を置いておく

local M = {};

M.get_keys = function(tbl)
  local keys = {}
  for key, _ in pairs(tbl) do
    table.insert(keys, key)
  end
  return keys
end

return M

