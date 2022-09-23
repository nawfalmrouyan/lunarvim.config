local M = {}

M.config = function()
  local status_ok, ccc = pcall(require, "ccc")
  if not status_ok then
    return
  end
  ccc.setup {
  }
end

return M
