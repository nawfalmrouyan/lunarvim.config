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
      ["core.norg.concealer"] = {
        config = { icon_preset = "diamond" },
      },
      ["core.integrations.telescope"] = {},
      ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
      ["core.presenter"] = { config = { zen_mode = "truezen" } },
      ["core.export.markdown"] = {},
      ["core.norg.manoeuvre"] = {},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            work = "~/adata/notes/work",
            home = "~/adata/notes/home",
          },
          default_workspace = "work",
        },
      },
    },
  }
  table.insert(lvim.builtin.cmp.sources, { name = "neorg" })
end

return M
