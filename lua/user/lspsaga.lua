local M = {}

M.config = function()
  local status_ok, saga = pcall(require, "lspsaga")
  if not status_ok then
    return
  end
  saga.init_lsp_saga()
  -- lsp finder to find the cursor word definition and reference
  vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

  -- or command
  -- vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true })
  -- jump and show diagnostics
  -- vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
  -- vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
  -- jump diagnostic
  -- or jump to error
  vim.keymap.set("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.ERROR }
  end, { silent = true })
  vim.keymap.set("n", "]E", function()
    require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.ERROR }
  end, { silent = true })
  -- or use command
  vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
  vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })

  -- lvim.builtin.which_key.mappings.l.o = { "<CMD>Lspsaga outline<cr>", "Outline" }
end

return M
