require("lvim.lsp.manager").setup "tailwindcss"
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { exe = "stylua" } }
