require("lvim.lsp.manager").setup "tailwindcss"
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { command = "prettier_d_slim" } }
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "eslint_d" } }

local opts = {
  filetypes = { "astro", "vue", "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
}
require("lvim.lsp.manager").setup("emmet_ls", opts)
-- local lspconfig = require'lspconfig'
-- local configs = require'lspconfig.configs'

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- if not configs.ls_emmet then
--   configs.ls_emmet = {
--     default_config = {
--       cmd = { 'ls_emmet', '--stdio' };
--       filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
--         'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
--       root_dir = function(fname)
--         return vim.loop.cwd()
--       end;
--       settings = {};
--     };
--   }
-- end

-- lspconfig.ls_emmet.setup{ capabilities = capabilities }
