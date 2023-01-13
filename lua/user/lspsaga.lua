local M = {}

M.config = function()
  local status_ok, saga = pcall(require, "lspsaga")
  if not status_ok then
    return
  end

  local keymap = vim.keymap.set

  -- Lsp finder find the symbol definition implement reference
  -- if there is no implement it will hide
  -- when you use action in finder like open vsplit then you can
  -- use <C-t> to jump back
  keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

  -- Code action
  keymap({"n","v"}, "<leader>oca", "<cmd>Lspsaga code_action<CR>")

  -- Rename
  keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

  -- Peek Definition
  -- you can edit the definition file in this flaotwindow
  -- also support open/vsplit/etc operation check definition_action_keys
  -- support tagstack C-t jump back
  keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")

  -- Go to Definition
  keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")

  -- Show line diagnostics you can pass arugment ++unfocus to make
  -- show_line_diagnsotic float window unfocus
  keymap("n", "<leader>osl", "<cmd>Lspsaga show_line_diagnostics<CR>")

  -- Show cursor diagnostic
  -- also like show_line_diagnostics  support pass ++unfocus
  keymap("n", "<leader>osc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

  -- Show buffer diagnostic
  keymap("n", "<leader>osb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

  -- Diagnsotic jump can use `<c-o>` to jump back
  keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

  -- Diagnostic jump with filter like Only jump to error
  keymap("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)
  keymap("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end)

  -- Outline
  keymap("n","<leader>olo", "<cmd>Lspsaga outline<CR>")

  -- Hover Doc
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

  -- Callhierarchy
  keymap("n", "<Leader>oci", "<cmd>Lspsaga incoming_calls<cr>")
  keymap("n", "<Leader>oco", "<cmd>Lspsaga outgoing_calls<cr>")

  -- Float terminal
  -- keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
  -- keymap("", "gh", "<cmd>Lspsaga lsp_finder<CR>")
  -- keymap("n", "[E", function()
  --   require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.ERROR }
  -- end, { silent = true })
  -- keymap("n", "]E", function()
  --   require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.ERROR }
  -- end, { silent = true })
  -- -- or use command
  -- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
  -- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })

  -- lvim.builtin.which_key.mappings.l.o = { "<CMD>Lspsaga outline<cr>", "Outline" }
end

return M
