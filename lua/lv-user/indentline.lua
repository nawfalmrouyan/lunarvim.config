local M = {}
M.config = function()
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
  vim.g.indent_blankline_buftype_exclude = { "qf", "terminal", "NvimTree" }

  vim.cmd [[highlight IndentOne guifg=#BF616A guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentTwo guifg=#D08770 guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentThree guifg=#EBCB8B guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentFour guifg=#A3BE8C guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentFive guifg=#5E81AC guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentSix guifg=#88C0D0 guibg=NONE gui=nocombine]]
  vim.cmd [[highlight IndentSeven guifg=#B48EAD guibg=NONE gui=nocombine]]
  vim.g.indent_blankline_char = "│"
  vim.g.indent_blankline_char_highlight_list = {
    "IndentOne",
    "IndentTwo",
    "IndentThree",
    "IndentFour",
    "IndentFive",
    "IndentSix",
    "IndentSeven",
  }
  vim.g.indent_blankline_show_first_indent_level = true
  vim.g.indent_blankline_show_trailing_blankline_indent = false
  vim.g.indent_blankline_show_current_context = true
  vim.g.indent_blankline_context_patterns = {
    "class",
    "function",
    "method",
    "block",
    "list_literal",
    "selector",
    "^if",
    "^table",
    "if_statement",
    "while",
    "for",
  }
  -- because lazy load indent-blankline so need readd this autocmd
  vim.cmd "autocmd CursorMoved * IndentBlanklineRefresh"
end

return M
