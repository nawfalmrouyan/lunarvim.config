local M = {}

M.init = function()
  lvim.builtin.which_key.vmappings["z"] = {
    name = "Zettelkasten",
    c = { ":'<'>ZkNewFromContentSelection<CR>" },
    l = { ":'<'>ZkInsertLinkAtSelection { matchSelected = true }<CR>", "Insert link using selected text" },
    s = { ":'<'>ZkMatch<CR>", "Search using selected text" },
    t = { ":'<'>ZkNewFromTitleSelection<CR>", "New note with selection as Title" },
  }
  lvim.builtin.which_key.mappings["z"] = {
    name = "Zettelkasten",
    f = {
      name = "Find notes",
      n = { "<cmd>ZkNotes<CR>", "List all notes" },
      o = { "<cmd>ZkOrphans<CR>", "List orphans" },
      r = { "<cmd>ZkRecents<CR>", "List recents" },
      t = { "<cmd>ZkTags<CR>", "List all tags" },
    },
    l = {
      name = "Links",
      b = { "<cmd>ZkBacklinks<CR>", "List backlinks" },
      i = { "<cmd>ZkInsertLink<CR>", "Insert link" },
      l = { "<cmd>ZkLinks<CR>", "List links" },
    },
    n = {
      name = "New Note",
      f = { "<cmd>ZkNew { dir = 'fleeting' }<CR>", "New fleeting note" },
      l = { "<cmd>ZkNew { dir = 'literature' }<CR>", "New literature note" },
      p = { "<cmd>ZkNew { dir = 'permanent' }<CR>", "New permanent note" },
    },
  }
end

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

  local commands = require "zk.commands"

  local function make_edit_fn(defaults, picker_options)
    return function(options)
      options = vim.tbl_extend("force", defaults, options or {})
      zk.edit(options, picker_options)
    end
  end

  commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
  commands.add("ZkRecents", make_edit_fn({ createdAfter = "2 weeks ago" }, { title = "Zk Recents" }))
end

return M
