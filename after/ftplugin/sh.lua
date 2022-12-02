local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { command = "shfmt", args = { "-i2", "-cn", "-bn" } } }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup { { exe = "flake8" } }
