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
vim.opt.listchars =
  { eol = "¬", trail = "·", precedes = "…", extends = "…", tab = "→\\ ", leadmultispace = "·" }
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 0
vim.opt.inccommand = "split"
vim.opt.guifont = "PragmataPro Nerd Font Mono:h11"
-- vim.cmd "set foldoptions=nodigits"

lvim.builtin.lualine.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.dap.active = false
lvim.builtin.terminal.active = true

lvim.lsp.diagnostics.virtual_text = false

lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.autotag.enable = true

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "fzy_native")
  pcall(telescope.load_extension, "media_files")
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
  "ocamlls",
  "phpactor",
  "psalm",
  "pylsp",
  "quick_lint_js",
  "reason_ls",
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
-- disable default keybindings for H/L
-- lvim.keys.normal_mode["<S-h>"] = false
-- lvim.keys.normal_mode["<S-l>"] = false
lvim.keys.normal_mode["<TAB>"] = ":BufferLinePick<CR>"
lvim.keys.normal_mode["<leader>j"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<leader>k"] = ":BufferLineCyclePrev<CR>"
-- insert blank lines
lvim.keys.normal_mode["<M-o>"] = "o<esc>"
lvim.keys.normal_mode["<M-O>"] = "O<esc>"
-- move to end line in wrap mode
lvim.keys.normal_mode["<M-$>"] = "g$"
lvim.keys.normal_mode["/"] = "ms/"
lvim.keys.term_mode["<Esc>"] = "<C-\\><C-N>"
-- search / replace word under cursor
lvim.keys.normal_mode["cg*"] = '*N"_cgn'
-- resize
lvim.keys.term_mode["<C-Up>"] = "<C-\\><C-N>resize -2<CR>"
lvim.keys.term_mode["<C-Down>"] = "<C-\\><C-N>resize +2<CR>"
lvim.keys.term_mode["<C-Left>"] = "<C-\\><C-N>vertical resize -2<CR>"
lvim.keys.term_mode["<C-Right>"] = "<C-\\><C-N>vertical resize +2<CR>"

lvim.keys.visual_block_mode["P"] = '"_c<c-r>0<esc>'
lvim.builtin.sell_soul_to_devel = true

-- Additional Plugins
lvim.plugins = {
  {
    "ray-x/lsp_signature.nvim",
    -- event = "BufRead",
    -- config = function()
    --   require("lsp_signature").on_attach()
    -- end,
  },
  {
    "glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
  },
  { "michaeljsmith/vim-indent-object", event = "BufRead" },
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
  { "nvim-telescope/telescope-fzy-native.nvim", run = "make" },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "mg979/vim-visual-multi", event = "BufEnter" }, -- vim -Nu ~/.local/share/lunarvim/site/pack/packer/start/vim-visual-multi/tutorialrc
  { "nvim-treesitter/nvim-treesitter-textobjects", before = "nvim-treesitter" },
  { "mzlogin/vim-markdown-toc", event = "BufRead" },
  {
    "ibhagwan/fzf-lua",
    setup = function()
      vim.api.nvim_set_keymap(
        "n",
        "<c-P>",
        "<cmd>lua require('fzf-lua').files()<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap("n", "<c-0>", ":FzfLua ", { noremap = true, silent = false })
      lvim.builtin.which_key.mappings["o"] = {
        name = "FZF",
        c = { "<cmd>lua require('fzf-lua').grep_cword()<cr>", "Find cword" },
        C = { "<cmd>lua require('fzf-lua').grep_cWORD()<cr>", "Find cWORD" },
        g = { "<cmd>lua require('fzf-lua').live_grep()<cr>", "Live grep" },
        G = { "<cmd>lua require('fzf-lua').live_grep_resume()<cr>", "Live grep resume" },
        f = { "<cmd>lua require('fzf-lua').files()<cr>", "Find files" },
        r = { "<cmd>lua require('fzf-lua').resume()<cr>", "Resume last search" },
        t = { "<cmd>lua require('fzf-lua').tabs()<cr>", "Resume last search" },
      }
    end,
    requires = { "kyazdani42/nvim-web-devicons" },
    event = "BufRead",
  },
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
    requires = "kevinhwang91/promise-async",
    config = function()
      require("user.nvim-ufo").config()
    end,
  },
  {
    "ellisonleao/glow.nvim",
    setup = function()
      lvim.builtin.which_key.mappings["m"] = { "<CMD>Glow<CR>", "Markdown Preview" }
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
    setup = function()
      lvim.builtin.which_key.mappings["z"] = {
        name = "Zk",
        T = { "<CMD>ZkNotes<CR>", "All Notes" },
        nf = { "<CMD>ZkNew {dir='fleeting'}<CR>", "New fleeting note" },
        nl = { "<CMD>ZkNew {dir='literature'}<CR>", "New literature note" },
        np = { "<CMD>ZkNew {dir='permanent'}<CR>", "New permanent note" },
        o = { "<CMD>ZkOrphans<CR>", "Orphan notes" },
        r = { "<CMD>ZkRecents<CR>", "Recent notes" },
        t = { "<CMD>ZkTags<CR>", "Tags" },
        f = { "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>" },
      }
    end,
    config = function()
      require("user.zk-nvim").config()
    end,
    event = "BufRead",
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    run = ":CatppuccinCompile",
    config = function()
      require("user.catppuccin").config()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    config = function()
      vim.g.mkdp_browser = "firefoxMD"
    end,
    ft = "markdown",
  },
  {
    "hrsh7th/cmp-cmdline",
    config = function()
      require("cmp").setup.cmdline(":", { sources = { { name = "cmdline" } } })
      require("cmp").setup.cmdline("/", { sources = { { name = "buffer" } } })
    end,
  },
  {
    "mbbill/undotree",
    event = "BufRead",
    setup = function()
      lvim.builtin.which_key.mappings["u"] = { "<CMD>UndotreeToggle<CR>", "Undo Tree" }
    end,
  },
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
    -- branch = "0.7.2",
    config = function()
      require("user.ccc").config()
    end,
  },
  {
    "f-person/git-blame.nvim",
    setup = function()
      lvim.builtin.which_key.mappings["a"] = { "<CMD>GitBlameToggle<CR>", "Toggle Git Blame" }
    end,
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
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
    setup = function()
      lvim.builtin.which_key.mappings["y"] = { "<CMD>Codi<CR>", "Codi" }
      lvim.builtin.which_key.mappings["Y"] = { "<CMD>Codi!<CR>", "Clear Codi" }
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
    requires = "ggandor/leap.nvim",
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
    "Pocco81/true-zen.nvim",
    setup = function()
      vim.api.nvim_set_keymap("n", "<M-=>", ":TZFocus<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<M-=>", "<C-\\><C-n>:TZFocus<cr>", { noremap = true, silent = true })
      lvim.builtin.which_key.mappings["Z"] = { "<CMD>TZAtaraxis<CR>", "Zen Mode" }
    end,
    config = function()
      require("true-zen").setup {}
    end,
    event = "BufRead",
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    setup = function()
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
  { "CursorHold", { pattern = { "<buffer>" }, command = "lua vim.diagnostic.open_float({focusable = false})" } },
  -- { "VimLeave,VimSuspend", { pattern = { "*" }, command = "guicursor=a:hor20" } },
}

lvim.builtin.which_key.mappings["?"] = { "<CMD>NvimTreeFindFile<CR>", "Find file in NvimTree" }
lvim.builtin.which_key.mappings["c"] = { "<CMD>bdelete!<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["M"] = { "<CMD>MarkdownPreview<CR>", "Markdown Preview" }

lvim.builtin.alpha.dashboard.section.header.val = {
  "   ____              ______ _____ ____ ",
  "  / __ \\____  ____ _/ / __ / ___// __ \\",
  " / / / / __ \\/ __ `/ / __  \\__ \\/ / / /",
  "/ /_/ / /_/ / /_/ / / /_/ ___/ / /_/ / ",
  "\\____/ .___/\\__,_/_/_____/____/_____/  ",
  "    /_/                                ",
}
