-- lvim.log.level = "warn"
lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "gruvbox-flat"
lvim.shell = "/usr/bin/zsh"
-- lvim.transparent_window = true

vim.opt.timeoutlen = 500
vim.opt.ignorecase = false
vim.opt.smartcase = false
vim.opt.guifont = "OpalSlab:h16"
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = { eol = "¬", trail = "·", precedes = "…", extends = "…", tab = "→\\ " }
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 0
-- vim.cmd "set foldmethod=manual"
vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"

lvim.builtin.lualine.active = false
lvim.builtin.bufferline.active = false
lvim.builtin.dashboard.active = true
lvim.builtin.dap.active = false
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 10
lvim.builtin.terminal.shading_factor = 1
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.diagnostics.signs.values = {
  { name = "LspDiagnosticsSignError", text = " " },
  { name = "LspDiagnosticsSignWarning", text = "" },
  { name = "LspDiagnosticsSignHint", text = "" },
  { name = "LspDiagnosticsSignInformation", text = "" },
}

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.context_commentstring.enable = true
lvim.builtin.treesitter.context_commentstring.enable_autocmd = false
lvim.builtin.treesitter.context_commentstring.config = {
  jsx_element = "{/* %s */}",
  jsx_fragment = "{/* %s */}",
  jsx_attribute = "// %s",
  typescript = "// %s",
  css = "/* %s */",
  scss = "/* %s */",
  html = "<!-- %s -->",
  svelte = "<!-- %s -->",
  vue = "<!-- %s -->",
  json = "",
}
lvim.builtin.comment.pre_hook = function(ctx)
  print("Hello-new", require("ts_context_commentstring.internal").calculate_commentstring(), ctx)
  return require("ts_context_commentstring.internal").calculate_commentstring()
  -- require('ts_context_commentstring.internal').update_commentstring()
end

lvim.builtin.telescope.on_config_done = function()
  require("telescope").load_extension "fzy_native"
end

lvim.builtin.treesitter.textobjects = {
  lookahead = true,
  select = {
    enable = true,
    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["aC"] = "@conditional.outer",
      ["iC"] = "@conditional.inner",
    },
  },
  swap = {
    enable = true,
    swap_next = {
      ["[w"] = "@parameter.inner",
    },
    swap_previous = {
      ["]w"] = "@parameter.inner",
    },
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]]"] = "@class.outer",
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer",
    },
  },
  lsp_interop = {
    enable = true,
    border = "rounded",
    peek_definition_code = {
      ["df"] = "@function.outer",
      ["dF"] = "@class.outer",
    },
  },
}

require'cmp'.setup.cmdline(':', { sources = { { name = 'cmdline' } } })

lvim.lang.lua.formatters = { { exe = "stylua" } }
lvim.lang.python.formatters = { { exe = "black" }, { exe = "isort" } }
lvim.lang.python.linters = { { exe = "flake8" } }
lvim.lang.javascriptreact.formatters = { { exe = "prettier" } }
lvim.lang.javascriptreact.linters = { { exe = "eslint_d" } }
lvim.lang.typescriptreact.formatters = { { exe = "prettier" } }
lvim.lang.typescriptreact.linters = { { exe = "eslint_d" } }
lvim.lang.sh.formatters = { { exe = "shfmt", arg = "-i 2 -ci -bn" } }
lvim.lang.typescript.on_attach = function(client, _)
  require("nvim-lsp-ts-utils").setup_client(client)
end
lvim.lang.typescriptreact.on_attach = lvim.lang.typescript.on_attach

-- Personal Keymaps
lvim.keys.insert_mode["<M-o>"] = "<C-o>o"
lvim.keys.insert_mode["<M-O>"] = "<C-o>O"
lvim.keys.normal_mode["<M-w>"] = ":set wrap! wrap?<cr>"
lvim.keys.normal_mode["<M-r>"] = ":set relativenumber! relativenumber?<cr>"
-- insert blank lines
lvim.keys.normal_mode["<M-o>"] = "o<esc>"
lvim.keys.normal_mode["<M-O>"] = "O<esc>"
-- move to end line in wrap mode
lvim.keys.normal_mode["<M-$>"] = "g$"
lvim.keys.normal_mode["/"] = "ms/"
lvim.keys.term_mode["<Esc>"] = "<C-\\><C-N>"
-- resize
lvim.keys.term_mode["<C-Up>"] = "<C-\\><C-N>resize -2<CR>"
lvim.keys.term_mode["<C-Down>"] = "<C-\\><C-N>resize +2<CR>"
lvim.keys.term_mode["<C-Left>"] = "<C-\\><C-N>vertical resize -2<CR>"
lvim.keys.term_mode["<C-Right>"] = "<C-\\><C-N>vertical resize +2<CR>"

lvim.keys.visual_block_mode["P"] = '"_c<c-r>0<esc>'

-- Additional Plugins
lvim.plugins = {
  { "hrsh7th/cmp-cmdline" },
  { "nathom/filetype.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("user.lsp_signature").config()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    setup = function()
      lvim.builtin.which_key.mappings["i"] = { "<cmd>IndentBlanklineToggle<CR>", "Indent Lines" }
    end,
    config = function()
      require("user.indentline").config()
    end,
    event = "BufRead",
  },
  {
    "windwp/windline.nvim",
    config = function()
      require "user.evil_line"
    end,
    event = "BufWinEnter",
  },
  { "tpope/vim-surround", event = "BufRead" },
  {
    "mbbill/undotree",
    event = "BufRead",
    setup = function()
      lvim.builtin.which_key.mappings["u"] = { "<cmd>UndotreeToggle<CR>", "Undo Tree" }
    end,
  },
  {
    "michaeljsmith/vim-indent-object",
    event = "BufRead",
  },
  -- {
  --   "dsznajder/vscode-es7-javascript-react-snippets",
  --   event = "BufRead",
  -- },
  { "tweekmonster/startuptime.vim" },
  {
    "kevinhwang91/nvim-bqf",
    event = "BufRead",
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "tpope/vim-repeat",
    event = "BufRead",
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("user.colorizer").config()
    end,
    event = "BufRead",
  },
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    config = function()
      require("user.ts_utils").config()
    end,
    ft = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  },
  {
    "f-person/git-blame.nvim",
    setup = function()
      lvim.builtin.which_key.mappings["a"] = { "<cmd>GitBlameToggle<CR>", "Toggle Git Blame" }
    end,
    event = "BufRead",
  }, -- Git Blame
  {
    "p00f/nvim-ts-rainbow",
    event = "BufEnter",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufEnter",
  },
  { "romgrk/fzy-lua-native" },
  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      require("user.dial").config()
    end,
  },
  { -- Peek changes live
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("user.numb").config()
    end,
  },
  { -- smooth scroll
    "karb94/neoscroll.nvim",
    -- event = "BufRead",
    config = function()
      require "user.neoscroll"
    end,
  },
  { -- Interactive scratchpad
    "metakirby5/codi.vim",
    cmd = "Codi",
    setup = function()
      lvim.builtin.which_key.mappings["y"] = { "<cmd>Codi<CR>", "Codi" }
      lvim.builtin.which_key.mappings["Y"] = { "<cmd>Codi!<CR>", "Clear Codi" }
    end,
  },
  { -- Symbol Outline
    "simrat39/symbols-outline.nvim",
    setup = function()
      lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }
    end,
    event = "BufRead",
  },
  -- { -- floating terminal
  --   "voldikss/vim-floaterm",
  --   config = function()
  --     require "user.floaterm"
  --   end,
  --   event = "BufEnter",
  -- },
  { -- better (IMHO) hop, sneak, quickscope
    "ggandor/lightspeed.nvim",
    config = function()
      require "user.lightspeed"
    end,
    event = "BufRead",
  },
  { -- generate code links
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    config = function()
      require("gitlinker").setup {
        opts = {
          add_current_line_on_normal_mode = true,
          action_callback = require("gitlinker.actions").copy_to_clipboard,
          print_url = false,
          mappings = "<leader>gy",
        },
      }
    end,
    requires = "nvim-lua/plenary.nvim",
  },
  {
    "Pocco81/TrueZen.nvim",
    setup = function()
      vim.api.nvim_set_keymap("n", "<M-=>", ":TZFocus<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<M-=>", "<C-\\><C-n>:TZFocus<cr>i", { noremap = true, silent = true })
      lvim.builtin.which_key.mappings["z"] = { "<cmd>TZAtaraxis<CR>", "Zen Mode" }
    end,
    event = "BufRead",
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("user.bufferline").config()
    end,
    requires = "nvim-web-devicons",
  },
  { -- diagnostics
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    setup = function()
      lvim.builtin.which_key.mappings.l.t = { "<cmd>TroubleToggle<CR>", "Trouble" }
    end,
  },
  {
    "eddyekofo94/gruvbox-flat.nvim",
    config = function()
      require "user.gruvbox-flat"
    end,
  },
  -- {
  --   "svitax/fennec-gruvbox.nvim",
  --   requires = { "rktjmp/lush.nvim" },
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   -- event = "BufRead",
  --   config = function()
  --     require "user.tokyonight"
  --   end,
  -- },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    run = "make",
  },
  -- {
  --   "gelguy/wilder.nvim",
  --   config = function()
  --     require("user.wilder").config()
  --   end,
  -- },
  -- {
  --   "wfxr/minimap.vim",
  --   setup = function()
  --     lvim.builtin.which_key.mappings["m"] = { "<cmd>MinimapToggle<CR>", "Minimap" }
  --   end,
  --   event = "BufRead",
  -- },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  },
  -- { "wellle/targets.vim" },
  {
    "nvim-neorg/neorg",
    config = function()
      require("neorg").setup {
        -- Tell Neorg what modules to load
        load = {
          ["core.defaults"] = {}, -- Load all the default modules
          ["core.keybinds"] = { -- Configure core.keybinds
            config = {
              default_keybinds = true, -- Generate the default keybinds
              neorg_leader = "<Leader>o", -- This is the default if unspecified
            },
          },
          ["core.norg.concealer"] = {}, -- Allows for use of icons
          ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
              workspaces = {
                my_workspace = "~/neorg",
              },
            },
          },
          ["core.integrations.telescope"] = {},
          ["core.norg.completion"] = {
            config = {
              engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
            },
          },
        },
      }
    end,
    requires = "vhyrro/neorg-telescope",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- branch = "0.5-compat",
    before = "nvim-treesitter",
  },
  -- { "tom-doerr/vim_codex", },
  -- {
  --   "chipsenkbeil/distant.nvim",
  --   config = function()
  --     require("distant").setup {
  --       -- Applies Chip's personal settings to every machine you connect to
  --       --
  --       -- 1. Ensures that distant servers terminate with no connections
  --       -- 2. Provides navigation bindings for remote directories
  --       -- 3. Provides keybinding to jump into a remote file's parent directory
  --       ["*"] = require("distant.settings").chip_default(),
  --     }
  --   end,
  -- },
}

lvim.autocommands.custom_groups = {
  -- will check for external file changes on cursor hold
  { "CursorHold", "*", "silent! checktime" },
  -- will switch between absolute and relative line numbers depending on mode
  {
    "InsertEnter",
    "*",
    "if &relativenumber | let g:backtorelative = 1 | setlocal number norelativenumber nocursorline | endif",
  },
  { "InsertLeave", "*", 'if exists("g:backtorelative") | setlocal relativenumber cursorline | endif' },
  { "WinEnter", "*", "setlocal cursorline" },
  { "WinLeave", "*", "setlocal nocursorline" },
  -- Terminal settings
  -- { "TermOpen", "*", "startinsert" },
  -- { "TermOpen", "*", "setlocal nonumber norelativenumber" },
  -- { "TermOpen", "*", "nnoremap <buffer> <C-c> i<C-c>" },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  s = { "<cmd>SessionSave<cr>", "Save Session" },
  l = { "<cmd>SessionLoad<cr>", "Load Session" },
}
lvim.builtin.which_key.mappings["?"] = { "<cmd>NvimTreeFindFile<CR>", "Open current dir" }
-- lvim.builtin.which_key.mappings["c"] = { "<cmd>bdelete!<CR>", "Close buffer" }

lvim.builtin.dashboard.custom_header = {
  "   ____              ______ _____ ____ ",
  "  / __ \\____  ____ _/ / __ / ___// __ \\",
  " / / / / __ \\/ __ `/ / __  \\__ \\/ / / /",
  "/ /_/ / /_/ / /_/ / / /_/ ___/ / /_/ / ",
  "\\____/ .___/\\__,_/_/_____/____/_____/  ",
  "    /_/                                ",
}

-- Neovim turns the default cursor to 'Block'  -- when switched back into terminal.  -- This below line fixes that. Uncomment if needed.
-- vim.cmd "autocmd VimLeave,VimSuspend * set guicursor=a:ver90" -- Beam
vim.cmd "autocmd VimLeave,VimSuspend * set guicursor=a:hor20"

-- NOTE: Above code doesn't take a value from the terminal's cursor and
--       replace it. It hardcodes the cursor shape.
--       And I think `ver` means vertical and `hor` means horizontal.
--       The numbers didn't make a difference in alacritty. Please change
--       the number to something that suits your needs if it looks weird.

-- local lspconfig = require'lspconfig'
-- local configs = require'lspconfig/configs'
-- local util = require 'lspconfig/util'

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- if not lspconfig.emmet_language_server then
--   configs.emmet_language_server = {
--     default_config = {
--       cmd = {'emmet-language-server', '--stdio'};
--       filetypes = {
--           'html', 'typescriptreact', 'javascriptreact', 'javascript',
--           'typescript', 'javascript.jsx', 'typescript.tsx', 'css'
--       },
--       root_dir = util.root_pattern("package.json", ".git"),
--       settings = {};
--     };
--   }
-- end
-- lspconfig.emmet_language_server.setup{ capabilities = capabilities; }
