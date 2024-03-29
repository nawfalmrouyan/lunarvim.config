local M = {}
M.config = function()
  vim.g.indent_blankline_filetype_exclude = {
    "NvimTree",
    "TelescopePrompt",
    "Trouble",
    "dashboard",
    "flutterToolsOutline",
    "git",
    "gitcommit",
    "help",
    "json",
    "log",
    "lspinfo",
    "man",
    "markdown",
    "neogitstatus",
    "org",
    "orgagenda",
    "packer",
    "qf",
    "startify",
    "terminal",
    "txt",
    "undotree",
    "vimwiki",
    "vista",
    "", -- for all buffers without a file type
  }
  -- vim.g.indent_blankline_buftype_exclude = { "qf", "terminal", "NvimTree" }
  vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }

  -- vim.cmd [[highlight Indent1 guifg=#BF616A guibg=NONE gui=nocombine]]
  -- vim.cmd [[highlight Indent2 guifg=#D08770 guibg=NONE gui=nocombine]]
  -- vim.cmd [[highlight Indent3 guifg=#EBCB8B guibg=NONE gui=nocombine]]
  -- vim.cmd [[highlight Indent4 guifg=#A3BE8C guibg=NONE gui=nocombine]]
  -- vim.cmd [[highlight Indent5 guifg=#5E81AC guibg=NONE gui=nocombine]]
  -- vim.cmd [[highlight Indent6 guifg=#88C0D0 guibg=NONE gui=nocombine]]
  -- vim.cmd [[highlight Indent7 guifg=#B48EAD guibg=NONE gui=nocombine]]
  -- -- vim.g.indent_blankline_char = "│"
  -- -- vim.g.indent_blankline_char = "▏"
  -- vim.g.indent_blankline_char_highlight_list = {
  --   "Indent1",
  --   "Indent2",
  --   "Indent3",
  --   "Indent4",
  --   "Indent5",
  --   "Indent6",
  --   "Indent7",
  -- }
  -- vim.g.indent_blankline_show_first_indent_level = true
  -- vim.g.indent_blankline_show_trailing_blankline_indent = false
  -- vim.g.indent_blankline_use_treesitter = true
  -- vim.g.indent_blankline_show_current_context = true
  -- vim.g.indent_blankline_context_patterns = {
  --   "^do",
  --   "^for",
  --   "^if",
  --   "^object",
  --   "^switch",
  --   "^table",
  --   "^while",
  --   "arguments",
  --   "block",
  --   "catch_clause",
  --   "class",
  --   "else_clause",
  --   "for",
  --   "function",
  --   "if_statement",
  --   "import_statement",
  --   "jsx_element",
  --   "jsx_self_closing_element",
  --   "list_literal",
  --   "method",
  --   "operation_type",
  --   "return",
  --   "selector",
  --   "try_statement",
  --   "while",
  -- }
  -- because lazy load indent-blankline so need readd this autocmd
  -- vim.cmd "autocmd CursorMoved * IndentBlanklineRefresh"

  -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
  -- vim.wo.colorcolumn = "99999"
end

return M
