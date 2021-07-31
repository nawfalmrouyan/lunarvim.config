-- Tokyonight theme
vim.g.tokyonight_style = "night"
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_variables = true
vim.g.tokyonight_transparent = true
vim.g.tokyonight_dark_sidebars = false
-- vim.g.tokyonight_sidebars = { "qf", "NvimTree", "floaterm", "Symbols", "terminal", "packer" }
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_hide_inactive_statusline = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
-- vim.cmd("colorscheme " .. lvim.colorscheme)
