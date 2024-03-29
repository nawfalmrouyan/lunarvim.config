local M = {}

M.config = function()
  local status_ok, kanagawa = pcall(require, "kanagawa")
  if not status_ok then
    return
  end

  vim.opt.fillchars:append {
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┨",
    vertright = "┣",
    verthoriz = "╋",
  }
  kanagawa.setup {
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true, -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = true, -- do not set background color
    dimInactive = true, -- dim inactive window `:h hl-NormalNC`
    globalStatus = true, -- adjust window separators highlight for laststatus=3
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = {},
    theme = "default", -- Load "default" theme or the experimental "light" theme
  }
end

return M
