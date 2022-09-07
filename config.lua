lvim.format_on_save = false
lvim.lint_on_save = false
-- lvim.colorscheme = "duskfox"
lvim.colorscheme = "catppuccin"
-- lvim.colorscheme = "onedarkpro"
lvim.shell = "/usr/bin/zsh"
-- lvim.transparent_window = true

vim.opt.cmdheight = 0
vim.opt.timeoutlen = 500
vim.opt.ignorecase = false
vim.opt.smartcase = false
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = { eol = "¬", trail = "·", precedes = "…", extends = "…", tab = "→\\ " }
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 0
vim.opt.inccommand = "split"
-- vim.cmd "set foldoptions=nodigits"
vim.go.laststatus = 3

lvim.builtin.lualine.active = true
lvim.builtin.lualine.options.globalstatus = true
-- lvim.builtin.lualine.options.theme = "duskfox"
lvim.builtin.lualine.options.theme = "catppuccin"
lvim.builtin.bufferline.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.dap.active = false
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 10
lvim.builtin.terminal.shading_factor = 1
-- lvim.builtin.which_key.mappings["P"] = { "<CMD>Telescope projects<CR>", "Projects" }
lvim.builtin.notify.opts.timeout = 2000

lvim.lsp.installer.setup.automatic_installation = true
-- lvim.lsp.automatic_servers_installation = true
lvim.lsp.diagnostics.virtual_text = false

-- lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.autotag.enable = true

-- syntax highlighting for .tf
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.hcl = {
  filetype = "hcl",
  "terraform",
}

lvim.builtin.telescope.on_config_done = function()
  require("telescope").load_extension "fzy_native"
  require("telescope").load_extension "media_files"
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
  "golangci_lint_ls",
  "graphql",
  "jedi_language_server",
  "ltex",
  "ocamlls",
  "phpactor",
  "psalm",
  "pylsp",
  "quick_lint_js",
  "rome",
  "reason_ls",
  "scry",
  "solang",
  "solidity_ls",
  "sorbet",
  "sourcekit",
  "sourcery",
  "spectral",
  "sqlls",
  "sqls",
  "stylelint_lsp",
  -- "tailwindcss",
  "tflint",
  "svlangserver",
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
  -- { "wellle/targets.vim" },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("user.lsp_signature").config()
    end,
  },
  { "michaeljsmith/vim-indent-object", event = "BufRead" },
  { "tweekmonster/startuptime.vim" },
  { "kevinhwang91/nvim-bqf", event = "BufRead" },
  { "p00f/nvim-ts-rainbow", event = "BufEnter" },
  { "windwp/nvim-ts-autotag", event = "InsertEnter" },
  { "romgrk/fzy-lua-native" },
  { "nvim-telescope/telescope-fzy-native.nvim", run = "make" },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "mg979/vim-visual-multi", event = "BufEnter" }, -- vim -Nu ~/.local/share/lunarvim/site/pack/packer/start/vim-visual-multi/tutorialrc
  { "nvim-treesitter/nvim-treesitter-textobjects", before = "nvim-treesitter" },
  {
    "renerocksai/telekasten.nvim",
    setup = function()
      lvim.builtin.which_key.mappings["z"] = {
        name = "Telekasten",
        f = { "<cmd>lua require('telekasten').find_notes()<CR>", "Find Notes" },
        d = { "<cmd>lua require('telekasten').find_daily_notes()<CR>", "Find Daily Notes" },
        g = { "<cmd>lua require('telekasten').search_notes()<CR>", "Search Notes" },
        l = { "<cmd>lua require('telekasten').follow_link()<CR>", "Follow Link" },
        T = { "<cmd>lua require('telekasten').goto_today()<CR>", "Goto Today" },
        W = { "<cmd>lua require('telekasten').goto_thisweek()<CR>", "Goto This Week" },
        w = { "<cmd>lua require('telekasten').find_weekly_notes()<CR>", "Find Weekly Notes" },
        n = { "<cmd>lua require('telekasten').new_note()<CR>", "New Note" },
        N = { "<cmd>lua require('telekasten').new_templated_note()<CR>", "New Templated Note" },
        y = { "<cmd>lua require('telekasten').yank_notelink()<CR>", "Yank Note Link" },
        c = { "<cmd>lua require('telekasten').show_calendar()<CR>", "Show Calendar" },
        C = { "<cmd>CalendarT<CR>", "Calendar" },
        i = { "<cmd>lua require('telekasten').paste_img_and_link()<CR>", "Paste Image and Link" },
        t = { "<cmd>lua require('telekasten').toggle_todo()<CR>", "Toggle Todo" },
        b = { "<cmd>lua require('telekasten').show_backlinks()<CR>", "Show Backlinks" },
        F = { "<cmd>lua require('telekasten').find_friends()<CR>", "Find Friends" },
        I = { "<cmd>lua require('telekasten').insert_img_link({ i=true })<CR>", "Insert Image Link" },
        p = { "<cmd>lua require('telekasten').preview_img()<CR>", "Preview Image" },
        m = { "<cmd>lua require('telekasten').browse_media()<CR>", "Browse Media" },
        a = { "<cmd>lua require('telekasten').show_tags()<CR>", "Show Tags" },
        r = { "<cmd>lua require('telekasten').rename_note()<CR>", "Rename Note" },
        z = { "<cmd>lua require('telekasten').panel()<CR>", "Panel" },
      }
    end,
    config = function()
      require("user.telekasten").config()
    end,
  },
  { "renerocksai/calendar-vim" },
  {
    "doums/suit.nvim",
    config = function()
      require("user.suit").config()
    end,
    event = "BufRead",
  },
  { "mzlogin/vim-markdown-toc" },
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
      require("nvim-surround").setup()
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
  -- {
  --   "mickael-menu/zk-nvim",
  --   setup = function()
  --     lvim.builtin.which_key.mappings["z"] = {
  --       name = "Zk",
  --       T = { "<CMD>ZkNotes<CR>", "All Notes" },
  --       nf = { "<CMD>ZkNew {dir='fleeting'}<CR>", "New fleeting note" },
  --       nl = { "<CMD>ZkNew {dir='literature'}<CR>", "New literature note" },
  --       np = { "<CMD>ZkNew {dir='permanent'}<CR>", "New permanent note" },
  --       o = { "<CMD>ZkOrphans<CR>", "Orphan notes" },
  --       r = { "<CMD>ZkRecents<CR>", "Recent notes" },
  --       t = { "<CMD>ZkTags<CR>", "Tags" },
  --       f = { "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>" },
  --     }
  --   end,
  --   config = function()
  --     require("user.zk-nvim").config()
  --   end,
  --   event = "BufRead",
  -- },
  { "olimorris/onedarkpro.nvim" },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    run = ":CatppuccinCompile",
    config = function()
      require("user.catppuccin").config()
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup {
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            functions = "italic,bold",
          },
        },
      }
      -- vim.cmd "colorscheme duskfox"
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
    "lukas-reineke/indent-blankline.nvim",
    setup = function()
      lvim.builtin.which_key.mappings["i"] = { "<CMD>IndentBlanklineToggle<CR>", "Indent Lines" }
    end,
    config = function()
      require("user.indentline").config()
    end,
    event = "BufRead",
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
    "rrethy/vim-hexokinase",
    run = "make hexokinase",
  },
  {
    "f-person/git-blame.nvim",
    setup = function()
      lvim.builtin.which_key.mappings["a"] = { "<CMD>GitBlameToggle<CR>", "Toggle Git Blame" }
    end,
    event = "BufRead",
  }, -- Git Blame
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
    event = "BufRead",
    config = function()
      require("user.neoscroll").config()
    end,
  },
  { -- Interactive scratchpad
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
  { -- diagnostics
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

-- Neovim turns the default cursor to 'Block'  -- when switched back into terminal.  -- This below line fixes that.
-- Uncomment if needed.
-- vim.cmd "autocmd VimLeave,VimSuspend * set guicursor=a:ver90" -- Beam
-- vim.cmd "autocmd VimLeave,VimSuspend * set guicursor=a:hor20"

-- NOTE: Above code doesn't take a value from the terminal's cursor and
--       replace it. It hardcodes the cursor shape.
--       And I think `ver` means vertical and `hor` means horizontal.
--       The numbers didn't make a difference in alacritty. Please change
--       the number to something that suits your needs if it looks weird.

vim.cmd [[
  let g:clipboard = {
    \ 'name': 'xsel',
    \ 'copy': {
    \    '+': 'xsel --nodetach -i -b',
    \    '*': 'xsel --nodetach -i -p',
    \  },
    \ 'paste': {
    \    '+': 'xsel -o -b',
    \    '*': 'xsel -o -p',
    \ },
    \ 'cache_enabled': 1,
    \ }
]]
