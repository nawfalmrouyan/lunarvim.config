require("lvim.lsp.manager").setup "tailwindcss"
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { exe = "prettier" } }
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { exe = "eslint_d" } }
