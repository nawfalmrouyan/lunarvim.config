require("lvim.lsp.manager").setup "tailwindcss"
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { command = "prettierd" } }
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "eslint_d" } }

local opts = {
  filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
}
require("lvim.lsp.manager").setup("emmet_ls", opts)
