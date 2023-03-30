vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jsonls" })
local opts = {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}
require("lvim.lsp.manager").setup("jsonls", opts)
