-- Tokyonight theme
vim.g.gruvbox_flat_style = "hard" -- dark | hard
vim.g.gruvbox_terminal_colors = true
vim.g.gruvbox_italic_comments = true
vim.g.gruvbox_italic_keywords = true
vim.g.gruvbox_italic_functions = true
vim.g.gruvbox_italic_variables = true
vim.g.gruvbox_transparent = false
vim.g.gruvbox_transparent_sidebar = false
vim.g.gruvbox_dark_sidebars = true
vim.g.gruvbox_sidebars = { "qf", "NvimTree", "floaterm", "Symbols", "terminal", "packer" }
vim.g.gruvbox_dark_float = true
vim.g.gruvbox_hide_inactive_statusline = true
vim.g.gruvbox_lualine_bold = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd("colorscheme " .. lvim.colorscheme)
