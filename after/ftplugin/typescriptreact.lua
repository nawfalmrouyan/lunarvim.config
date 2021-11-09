require("lvim.lsp.manager").setup "tailwindcss"
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { exe = "prettier" } }
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { exe = "eslint_d" } }

local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
local util = require 'lspconfig/util'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not lspconfig.emmet_language_server then
  configs.emmet_language_server = {
    default_config = {
      cmd = {'emmet-language-server', '--stdio'};
      filetypes = {
          'html', 'typescriptreact', 'javascriptreact', 'javascript',
          'typescript', 'javascript.jsx', 'typescript.tsx', 'css'
      },
      root_dir = util.root_pattern("package.json", ".git"),
      settings = {};
    };
  }
end
lspconfig.emmet_language_server.setup{ capabilities = capabilities; }
