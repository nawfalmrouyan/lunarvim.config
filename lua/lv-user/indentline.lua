local M = {}
M.config = function()
  vim.g.indentLine_enabled = 1
  vim.g.indent_blankline_char = "│"

  vim.g.indent_blankline_filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "qf",
    "man",
    "packer",
    "lspinfo",
    "LICENSE",
  }
  vim.g.indent_blankline_buftype_exclude = { "qf", "terminal" }
  vim.g.indent_blankline_show_current_context = true
  vim.g.indentLine_faster = 1

  vim.g.indent_blankline_show_trailing_blankline_indent = false
  vim.g.indent_blankline_show_first_indent_level = true

  -- vim.g.indent_blankline_space_char_blankline = '•'
  -- vim.g.indent_blankline_space_char = '•'
  -- vim.g.indent_blankline_use_treesitter = true
  vim.g.indent_blankline_context_patterns = {
    "^for",
    "^if",
    "^object",
    "^table",
    "^while",
    "arguments",
    "block",
    "catch_clause",
    "class",
    "else_clause",
    "function",
    "if_statement",
    "import_statement",
    "jsx_element",
    "jsx_self_closing_element",
    "method",
    "operation_type",
    "return",
    "try_statement",
  }
  -- vim.g.indent_blankline_char_highlight_list = {'Whitespace', 'LineNr'}

  O.user_which_key["i"] = { "<cmd>IndentBlanklineToggle<CR>", "Indent Lines" }
end
return M
