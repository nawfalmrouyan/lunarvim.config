local M = {}

M.config = function()
  local status_ok, neorg = pcall(require, "neorg")
  if not status_ok then
    return
  end
  neorg.setup {
    load = {
      ["core.defaults"] = {},
      ["core.completion"] = { config = { engine = "nvim-cmp" } },
      ["core.concealer"] = { config = { icon_preset = "diamond" } },
      ["core.export"] = {},
      ["core.export.markdown"] = {},
      ["core.manoeuvre"] = {},
      ["core.presenter"] = { config = { zen_mode = "truezen" } },
      ["core.summary"] = {},
      ["core.ui.calendar"] = {},
      ["core.integrations.telescope"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            fleeting = "~/notes/fleeting",
            literature = "~/notes/literature",
            permanent = "~/notes/permanent",
          },
          default_workspace = "fleeting",
        },
      },
    },
  }
  table.insert(lvim.builtin.cmp.sources, { name = "neorg" })
end

return M
