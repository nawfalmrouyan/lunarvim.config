-- vim.o.background = "dark" -- or light if you so prefer
require("gruvqueen").setup {
  config = {
    disable_bold = true,
    italic_comments = true,
    italic_keywords = true,
    italic_functions = true,
    italic_variables = true,
    invert_selection = false,
    style = "original", -- possible values: 'original', 'mix', 'material'
    -- transparent_background = true,
    -- bg_color = "black",
  },
}
