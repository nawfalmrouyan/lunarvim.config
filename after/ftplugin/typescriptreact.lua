require("lvim.lsp.manager").setup("tailwindcss")
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "prettier", filetypes = { "typescript", "typescriptreact" }, },
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "eslint_d", filetypes = { "javascript", "javascriptreact" }, },
}
