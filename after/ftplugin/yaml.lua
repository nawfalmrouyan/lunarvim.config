vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "yamlls" })
local opts = {
  settings = {
    yaml = {
      schemas = require('schemastore').yaml.schemas(),
    },
  },
}
require("lvim.lsp.manager").setup("yamlls", opts)
