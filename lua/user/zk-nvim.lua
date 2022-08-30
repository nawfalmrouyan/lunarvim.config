local M = {}

M.config = function()
  local status_ok, zk = pcall(require, "zk")
  if not status_ok then
    return
  end
  zk.setup {
    picker = "telescope",
    lsp = {
      config = {
        cmd = { "zk", "lsp" },
        name = "zk",
      },
    },
    auto_attach = {
      enabled = true,
      filetypes = { "markdown" },
    },
  }

  local zk = require "zk"
  local commands = require "zk.commands"

  local function make_edit_fn(defaults, picker_options)
    return function(options)
      options = vim.tbl_extend("force", defaults, options or {})
      zk.edit(options, picker_options)
    end
  end

  commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
  commands.add("ZkRecents", make_edit_fn({ createdAfter = "2 weeks ago" }, { title = "Zk Recents" }))

  require("telescope").load_extension "zk"
end

return M
