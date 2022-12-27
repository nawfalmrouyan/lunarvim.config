lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "catppuccin"
lvim.builtin.lualine.options.theme = "catppuccin"
lvim.shell = "/usr/bin/zsh"
lvim.transparent_window = true

-- vim.opt.cmdheight = 0
-- vim.opt.timeoutlen = 500
vim.opt.ignorecase = false
vim.opt.smartcase = false
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = { eol = "¬", trail = "·", precedes = "…", extends = "…", tab = "→\\ " }
vim.opt.showbreak = "﬌ "
vim.opt.wrap = true
-- vim.opt.scrolloff = 0
-- vim.opt.sidescrolloff = 0
vim.opt.inccommand = "split"
vim.opt.guifont = "PragmataPro Nerd Font Mono:h11"
-- vim.opt.foldoptions = "nodigits"

lvim.builtin.lualine.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.bufferline.options.show_buffer_close_icons = false
lvim.builtin.bufferline.options.show_close_icon = false
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.dap.active = false
lvim.builtin.terminal.active = true

lvim.lsp.diagnostics.virtual_text = false

-- lvim.builtin.treesitter.ensure_installed = { "python,lua,bash,javascript,typescript" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.textsubjects.enable = true
lvim.builtin.mason.ensure_installed = {
  "bashls",
  "black",
  "clangd",
  "cssls",
  "emmet_ls",
  "eslint_d",
  "flake8",
  "html",
  "isort",
  "jsonls",
  "prettierd",
  "pyright",
  "shellcheck",
  "shfmt",
  "stylua",
  "sumneko_lua",
  "tailwindcss",
  "tsserver",
  "yamlls",
  "zk",
}

lvim.builtin.telescope.theme = "center"
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "fzy_native")
  pcall(telescope.load_extension, "zk")
  pcall(telescope.load_extension, "media_files")
end

lvim.builtin.cmp.cmdline.enable = true

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

lvim.lsp.automatic_configuration.skipped_servers = {
  "angularls",
  "ansiblels",
  "ccls",
  "csharp_ls",
  "cssmodules_ls",
  "denols",
  "ember",
  -- "emmet_ls",
  "eslint",
  "eslintls",
  "glint",
  "golangci_lint_ls",
  "gradle_ls",
  "graphql",
  "jedi_language_server",
  "ltex",
  "neocmake",
  "ocamlls",
  "phpactor",
  "psalm",
  "pylsp",
  "quick_lint_js",
  "reason_ls",
  "rnix",
  "rome",
  "ruby_ls",
  "scry",
  "solang",
  "solc",
  "solidity_ls",
  "sorbet",
  "sourcekit",
  "sourcery",
  "spectral",
  "sqlls",
  "sqls",
  "stylelint_lsp",
  "svlangserver",
  "tflint",
  "verible",
  "vuels",
}

-- Personal Keymaps
lvim.keys.insert_mode["<M-o>"] = "<C-o>o"
lvim.keys.insert_mode["<M-O>"] = "<C-o>O"
lvim.keys.normal_mode["<M-w>"] = ":set wrap! wrap?<cr>"
lvim.keys.normal_mode["<M-r>"] = ":set relativenumber! relativenumber?<cr>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<TAB>"] = ":BufferLinePick<cr>"
lvim.keys.normal_mode["<M-o>"] = "o<esc>"
lvim.keys.normal_mode["<M-O>"] = "O<esc>"
lvim.keys.normal_mode["<M-$>"] = "g$"
lvim.keys.normal_mode["/"] = "ms/"

-- From the primeagen
lvim.keys.normal_mode["J"] = "mzJ`z"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["Q"] = "<nop>"
lvim.keys.normal_mode["<leader>x"] = "<cmd>!chmod +x %<cr>"

lvim.keys.term_mode["<Esc>"] = "<C-\\><C-N>"
lvim.keys.term_mode["<C-Up>"] = "<C-\\><C-N>resize -2<cr>"
lvim.keys.term_mode["<C-Down>"] = "<C-\\><C-N>resize +2<cr>"
lvim.keys.term_mode["<C-Left>"] = "<C-\\><C-N>vertical resize -2<cr>"
lvim.keys.term_mode["<C-Right>"] = "<C-\\><C-N>vertical resize +2<cr>"

lvim.keys.visual_block_mode["P"] = '"_c<c-r>0<esc>'
lvim.builtin.sell_soul_to_devel = true

-- Additional Plugins
lvim.plugins = {
  {
    "echasnovski/mini.map",
    branch = "stable",
    init = function()
      lvim.builtin.which_key.mappings["mm"] = { "<cmd>lua MiniMap.toggle()<cr>", "Minimap" }
    end,
    config = function()
      require("mini.map").setup()
      local map = require "mini.map"
      map.setup {
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.diagnostic {
            error = "DiagnosticFloatingError",
            warn = "DiagnosticFloatingWarn",
            info = "DiagnosticFloatingInfo",
            hint = "DiagnosticFloatingHint",
          },
        },
        symbols = {
          encode = map.gen_encode_symbols.dot "4x2",
        },
        window = {
          side = "right",
          width = 20, -- set to 1 for a pure scrollbar :)
          winblend = 0,
          show_integration_count = false,
        },
      }
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    ft = { "fugitive" },
  },
  {
    "mattn/vim-gist",
    event = "BufRead",
    dependencies = "mattn/webapi-vim",
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup {
        mapping = { "jk", "jj", "kj" },
      }
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase" },
        lastplace_open_folds = true,
      }
    end,
  },
  { "RRethy/nvim-treesitter-textsubjects", before = "nvim-treesitter" },
  {
    "mbbill/undotree",
    event = "BufRead",
    init = function()
      lvim.builtin.which_key.mappings.u = { "<cmd>UndotreeToggle<cr>", "Undo" }
    end,
  },
  { "tpope/vim-repeat" },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    -- module = "persistence",
    lazy = true,
    init = function()
      lvim.builtin.which_key.mappings["S"] = {
        name = "Session",
        c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
        l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
        Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
      }
    end,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            "class",
            "function",
            "method",
          },
        },
      }
    end,
  },
  { "nvim-telescope/telescope-media-files.nvim", event = "BufRead" },
  {
    "stevearc/aerial.nvim",
    init = function()
      lvim.builtin.which_key.mappings.l.o = { "<cmd>AerialToggle!<cr>", "Outline" }
    end,
    config = function()
      require("aerial").setup {
        show_guides = true,
      }
    end,
  },
  {
    "lmburns/lf.nvim",
    init = function()
      lvim.builtin.which_key.mappings["r"] = { "<cmd>Lf<cr>", "File Manager" }
    end,
    config = function()
      -- This feature will not work if the plugin is lazy-loaded
      vim.g.lf_netrw = 1

      require("lf").setup {
        escape_quit = false,
        border = "rounded",
        highlights = { FloatBorder = { guifg = "#819c3b" } },
        winblend = 0,
      }
    end,
    dependencies = { "plenary.nvim", "toggleterm.nvim" },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  -- {
  --   "glacambre/firenvim",
  --   run = function()
  --     vim.fn["firenvim#install"](0)
  --   end,
  -- },
  { "tweekmonster/startuptime.vim" },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup {
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      }
    end,
  },
  { "p00f/nvim-ts-rainbow", event = "BufEnter" },
  { "windwp/nvim-ts-autotag", event = "InsertEnter" },
  { "romgrk/fzy-lua-native" },
  { "nvim-telescope/telescope-fzy-native.nvim", build = "make", event = "BufRead" },
  {
    "mg979/vim-visual-multi",
    event = "BufEnter",
    init = function()
      vim.cmd "let g:VM_default_mappings = 0"
    end,
  }, -- vim -Nu ~/.local/share/lunarvim/site/pack/packer/start/vim-visual-multi/tutorialrc
  { "nvim-treesitter/nvim-treesitter-textobjects", before = "nvim-treesitter" },
  { "mzlogin/vim-markdown-toc", event = "BufRead" },
  -- {
  --   "ibhagwan/fzf-lua",
  --   event = "BufRead",
  --   dependencies = { "kyazdani42/nvim-web-devicons" },
  --   init = function()
  --     vim.api.nvim_set_keymap(
  --       "n",
  --       "<c-P>",
  --       "<cmd>lua require('fzf-lua').files()<cr>",
  --       { noremap = true, silent = true }
  --     )
  --     vim.api.nvim_set_keymap("n", "<c-0>", ":FzfLua ", { noremap = true, silent = false })
  --     lvim.builtin.which_key.mappings["f"] = {
  --       name = "FZF",
  --       c = { "<cmd>lua require('fzf-lua').grep_cword()<cr>", "Find cword" },
  --       C = { "<cmd>lua require('fzf-lua').grep_cWORD()<cr>", "Find cWORD" },
  --       g = { "<cmd>lua require('fzf-lua').live_grep()<cr>", "Live grep" },
  --       G = { "<cmd>lua require('fzf-lua').live_grep_resume()<cr>", "Live grep resume" },
  --       f = { "<cmd>lua require('fzf-lua').files()<cr>", "Find files" },
  --       r = { "<cmd>lua require('fzf-lua').resume()<cr>", "Resume last search" },
  --       t = { "<cmd>lua require('fzf-lua').tabs()<cr>", "Resume last search" },
  --     }
  --   end,
  -- },
  {
    "kylechui/nvim-surround",
    event = "BufEnter",
    config = function()
      require("nvim-surround").setup {
        keymaps = {
          insert = "<C-g>z",
          insert_line = "gC-ggZ",
          normal = "gz",
          normal_cur = "gZ",
          normal_line = "gzz",
          normal_cur_line = "gZZ",
          visual = "gz",
          visual_line = "gZ",
          delete = "gzd",
          change = "gzr",
        },
      }
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufRead",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("user.nvim-ufo").config()
    end,
  },
  {
    "ellisonleao/glow.nvim",
    init = function()
      lvim.builtin.which_key.mappings["mg"] = { "<cmd>Glow<cr>", "Markdown Preview" }
    end,
    config = function()
      require("glow").setup {
        border = "rounded",
      }
    end,
    ft = "markdown",
  },
  {
    "mickael-menu/zk-nvim",
    init = function()
      lvim.builtin.which_key.mappings["Z"] = {
        name = "Zk",
        T = { "<cmd>ZkNotes<cr>", "All Notes" },
        nf = { "<cmd>ZkNew {dir='fleeting'}<cr>", "New fleeting note" },
        nl = { "<cmd>ZkNew {dir='literature'}<cr>", "New literature note" },
        np = { "<cmd>ZkNew {dir='permanent'}<cr>", "New permanent note" },
        o = { "<cmd>ZkOrphans<cr>", "Orphan notes" },
        r = { "<cmd>ZkRecents<cr>", "Recent notes" },
        t = { "<cmd>ZkTags<cr>", "Tags" },
        f = { "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<cr>" },
      }
    end,
    config = function()
      require("user.zk-nvim").config()
    end,
    event = "BufRead",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    build = ":CatppuccinCompile",
    config = function()
      require("user.catppuccin").config()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      lvim.builtin.which_key.mappings["m"] =
        { name = "Markdown & Minimap", M = { "<cmd>MarkdownPreview<cr>", "Markdown Preview" } }
    end,
    config = function()
      vim.g.mkdp_browser = "firefoxMD"
    end,
    ft = "markdown",
  },
  { "hrsh7th/cmp-cmdline" },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    event = "BufRead",
    config = function()
      require("user.ccc").config()
    end,
  },
  {
    "f-person/git-blame.nvim",
    init = function()
      lvim.builtin.which_key.mappings["a"] = { "<cmd>GitBlameToggle<cr>", "Toggle Git Blame" }
      vim.g.gitblame_enabled = 0
    end,
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
    end,
    event = "BufRead",
  },
  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      require("user.dial").config()
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("user.numb").config()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "BufRead",
    config = function()
      require("user.neoscroll").config()
    end,
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
    ft = { "python", "javascript", "php" },
    init = function()
      lvim.builtin.which_key.mappings["y"] = { "<cmd>Codi<cr>", "Codi" }
      lvim.builtin.which_key.mappings["Y"] = { "<cmd>Codi!<cr>", "Clear Codi" }
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").set_default_keymaps()
    end,
    event = "BufRead",
  },
  {
    "ggandor/flit.nvim",
    dependencies = "ggandor/leap.nvim",
    event = "BufRead",
    config = function()
      require("flit").setup {
        keys = { f = "f", F = "F", t = "t", T = "T" },
        labeled_modes = "v",
        multiline = true,
        opts = {},
      }
    end,
  },
  {
    "notjedi/nvim-rooter.lua",
    config = function()
      require("nvim-rooter").setup {
        rooter_patterns = { ".git", ".hg", ".svn", "*.conf" },
        trigger_patterns = { "*" },
        manual = false,
      }
    end,
  },
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    init = function()
      lvim.builtin.which_key.mappings["gy"] =
        { "<cmd>lua require'gitlinker'.get_buf_range_url('n')<cr>", "Generate git link" }
    end,
    config = function()
      require("gitlinker").setup {
        opts = {
          add_current_line_on_normal_mode = true,
          action_callback = require("gitlinker.actions").copy_to_clipboard,
          print_url = false,
          -- mappings = "<leader>gy",
        },
      }
    end,
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "Pocco81/true-zen.nvim",
    event = "BufRead",
    init = function()
      lvim.builtin.which_key.mappings["z"] =
        { name = "Zen", z = { "<cmd>TZAtaraxis<cr>", "Zen Mode" }, f = { "<cmd>TZFocus<cr>", "Focus window" } }
      vim.api.nvim_set_keymap("n", "<M-=>", ":TZFocus<cr>", { noremap = true, silent = false })
      vim.api.nvim_set_keymap("t", "<M-=>", "<C-\\><C-n>:TZFocus<cr>i", { noremap = true, silent = false })
    end,
    config = function()
      require("true-zen").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    init = function()
      lvim.builtin.which_key.mappings["t"] = {
        name = "Diagnostics",
        t = { "<cmd>TroubleToggle<cr>", "trouble" },
        w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
        d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
        q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
        l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
        r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
      }
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "BufRead",
    config = function()
      require("user.lspsaga").config()
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
  { "christoomey/vim-tmux-navigator" },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  { "wakatime/vim-wakatime" },
}

lvim.autocommands = {
  {
    "InsertEnter",
    {
      pattern = { "*" },
      command = "if &relativenumber | let g:backtorelative = 1 | setlocal number norelativenumber nocursorline | endif",
    },
  },
  {
    "InsertLeave",
    { pattern = { "*" }, command = 'if exists("g:backtorelative") | setlocal relativenumber cursorline | endif' },
  },
  { "CursorHold", { pattern = { "*" }, command = "lua vim.diagnostic.open_float({focusable = false})" } },
  -- { "VimLeave,VimSuspend", { pattern = { "*" }, command = "guicursor=a:hor20" } },
}

lvim.builtin.which_key.mappings["?"] = { "<cmd>NvimTreeFindFile<cr>", "Find file in NvimTree" }
lvim.builtin.which_key.mappings["c"] = { "<cmd>bdelete!<cr>", "Close Buffer" }

lvim.builtin.alpha.dashboard.section.header.val = {
  "   ____              ______ _____ ____ ",
  "  / __ \\____  ____ _/ / __ / ___// __ \\",
  " / / / / __ \\/ __ `/ / __  \\__ \\/ / / /",
  "/ /_/ / /_/ / /_/ / / /_/ ___/ / /_/ / ",
  "\\____/ .___/\\__,_/_/_____/____/_____/  ",
  "    /_/                                ",
}

-- vim.cmd [[
-- if !empty($WAYLAND_DISPLAY)
--   let g:clipboard = {
--         \   'name': 'wayland-strip-carriage',
--         \   'copy': {
--         \      '+': 'wl-copy --foreground --type text/plain',
--         \      '*': 'wl-copy --foreground --type text/plain --primary',
--         \    },
--         \   'paste': {
--         \      '+': {-> systemlist('wl-paste --no-newline | tr -d "\r"')},
--         \      '*': {-> systemlist('wl-paste --no-newline --primary | tr -d "\r"')},
--         \   },
--         \   'cache_enabled': 1,
--         \ }
-- endif
-- ]]
