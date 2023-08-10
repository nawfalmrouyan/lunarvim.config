local M = {}

M.config = function()
  local status_ok, neorg = pcall(require, "neorg")
  if not status_ok then
    return
  end
  neorg.setup {
    load = {
      ["core.defaults"] = {},
      ["core.upgrade"] = {},
      ["core.summary"] = {},
      ["core.concealer"] = {
        config = { icon_preset = "diamond" },
      },
      ["core.integrations.telescope"] = {},
      ["core.completion"] = { config = { engine = "nvim-cmp" } },
      ["core.presenter"] = { config = { zen_mode = "truezen" } },
      ["core.export.markdown"] = {},
      ["core.manoeuvre"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            work = "~/notes/work",
            home = "~/notes/home",
          },
          default_workspace = "work",
        },
      },
    },
  }
  table.insert(lvim.builtin.cmp.sources, { name = "neorg" })
end

return M
