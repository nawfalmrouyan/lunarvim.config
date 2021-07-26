--[[
lvim is the global options object

Formatters and linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE ClvimNFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
lvim.format_on_save = false
lvim.lint_on_save = false
-- lvim.completion.autocomplete = true
lvim.colorscheme = "tokyonight"
lvim.shell = "/usr/bin/zsh"
-- lvim.auto_close_tree = 1
-- lvim.nvim_tree_disable_netrw = 1
lvim.transparent_window = false

-- defaults
-- lvim.default_options.timeoutlen = 500
-- lvim.default_options.ignorecase = false
-- lvim.default_options.smartcase = false
-- lvim.default_options.foldmethod = "manual"
-- lvim.default_options.foldexpr = "nvim_treesitter#foldexpr()"
-- lvim.default_options.guifont = "Iosevka:h24"
-- lvim.default_options.relativenumber = true

-- After changing plugin config it is recommended to run :PackerCompile
lvim.builtin.galaxyline.active = false
lvim.builtin.dashboard.active = true
-- lvim.builtin.zen.active = false
lvim.builtin.dap.active = false

-- Active LSPs
-- lvim.lang.emmet.active = true
-- lvim.lang.tailwindcss.active = true

-- lvim.treesitter.ensure_installed = "maintained"
-- lvim.treesitter.ignore_install = { "haskell" }
-- lvim.treesitter.highlight.enabled = true
-- lvim.treesitter.rainbow.enable = true
-- lvim.treesitter.autotag.enable = true
-- lvim.treesitter.context_commentstring.enable = true
-- lvim.treesitter.context_commentstring.config = {
--   jsx_element = "{/* %s */}",
--   jsx_fragment = "{/* %s */}",
--   jsx_attribute = "// %s",
-- }

-- Personal Keymaps
lvim.keys.normal_mode = {
  -- Better window movement
  { "<C-h>", "<C-w>h" },
  { "<C-j>", "<C-w>j" },
  { "<C-k>", "<C-w>k" },
  { "<C-l>", "<C-w>l" },
  -- Resize with arrows
  { "<C-Down>", ":resize -2<CR>" },
  { "<C-Up>", ":resize +2<CR>" },
  { "<C-Left>", ":vertical resize -2<CR>" },
  { "<C-Right>", ":vertical resize +2<CR>" },
  -- Move current line / block with Alt-j/k a la vscode.
  { "<A-j>", ":m .+1<CR>==" },
  { "<A-k>", ":m .-2<CR>==" },
  -- QuickFix
  { "]q", ":cnext<CR>" },
  { "[q", ":cprev<CR>" },
  { "<C-q>", ":call QuickFixToggle()<CR>" },
  -- {'<C-TAB>', 'compe#complete()', {noremap = true, silent = true, expr = true}},
  { "<M-w>", ":set wrap! wrap?<cr>" },
  { "<M-r>", ":set relativenumber! relativenumber?<cr>" },
  -- insert blank lines
  { "<M-o>", "o<esc>" },
  { "<M-lvim>", "O<esc>" },
  -- move to end line in wrap mode
  { "<M-$>", "g$" },
  { "/", "ms/" },
  -- resize
  { "<M-j>", ":resize -2<CR>" },
  { "<M-k>", ":resize +2<CR>" },
  { "<M-h>", ":vertical resize -2<CR>" },
  { "<M-l>", ":vertical resize +2<CR>" },
}
lvim.keys.insert_mode = {
  -- I hate escape
  { "jk", "<ESC>" },
  { "kj", "<ESC>" },
  { "jj", "<ESC>" },
  -- Move current line / block with Alt-j/k ala vscode.
  { "<A-j>", "<Esc>:m .+1<CR>==gi" },
  { "<A-k>", "<Esc>:m .-2<CR>==gi" },
  -- navigation
  { "<A-Up>", "<C-\\><C-N><C-w>h" },
  { "<A-Down>", "<C-\\><C-N><C-w>j" },
  { "<A-Left>", "<C-\\><C-N><C-w>k" },
  { "<A-Right>", "<C-\\><C-N><C-w>l" },
  -- Insert blank lines
  { "<M-o>", "<C-o>o" },
  { "<M-lvim>", "<C-o>O" },
}
lvim.keys.term_mode = {
  -- Terminal window navigation
  { "<C-h>", "<C-\\><C-N><C-w>h" },
  { "<C-j>", "<C-\\><C-N><C-w>j" },
  { "<C-k>", "<C-\\><C-N><C-w>k" },
  { "<C-l>", "<C-\\><C-N><C-w>l" },
  { "<Esc>", "<C-\\><C-N>" },
  -- resize
  { "<M-j>", "<C-\\><C-N>resize -2<CR>" },
  { "<M-k>", "<C-\\><C-N>resize +2<CR>" },
  { "<M-h>", "<C-\\><C-N>vertical resize -2<CR>" },
  { "<M-l>", "<C-\\><C-N>vertical resize +2<CR>" },
  { "<C-Up>", "<C-\\><C-N>resize -2<CR>" },
  { "<C-Down>", "<C-\\><C-N>resize +2<CR>" },
  { "<C-Left>", "<C-\\><C-N>vertical resize -2<CR>" },
  { "<C-Right>", "<C-\\><C-N>vertical resize +2<CR>" },
}
-- Additional Plugins
lvim.plugins = {
  {
    "ahmedkhalf/lsp-rooter.nvim",
    config = function()
      require("lsp-rooter").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("lv-user/indentline").config()
    end,
  },
  {
    "windwp/windline.nvim",
    config = function()
      require "lv-user/windline"
    end,
    event = "BufWinEnter",
  },
  { "tpope/vim-surround", event = "BufRead" },
  {
    "mbbill/undotree",
    event = "BufRead",
--     setup = function()
--       lvim.builtin.which_key["u"] = { "<cmd>UndotreeToggle<CR>", "Undo Tree" }
--     end,
  },
  { "michaeljsmith/vim-indent-object", event = "BufRead" },
  { "dsznajder/vscode-es7-javascript-react-snippets", event = "BufRead" },
  { "tweekmonster/startuptime.vim" },
  { "kevinhwang91/nvim-bqf", event = "BufRead" }, -- Better quickfix
  { "andymass/vim-matchup", event = "BufRead" }, -- matchup
  -- { "glepnir/zephyr-nvim", event = "Bufread" }, -- zephyr colorscheme
  { "tpope/vim-repeat", event = "BufRead" },
  { "norcalli/nvim-colorizer.lua", event = "BufWinEnter" },
  { "folke/todo-comments.nvim", event = "BufRead" },
  {
    "f-person/git-blame.nvim",
--     setup = function()
--       lvim.builtin.which_key["a"] = { "<cmd>GitBlameToggle<CR>", "Toggle Git Blame" }
--     end,
    event = "BufRead",
  }, -- Git Blame
  { "p00f/nvim-ts-rainbow", after = { "telescope.nvim" } }, -- Pretty parentheses
  { "windwp/nvim-ts-autotag", after = { "telescope.nvim" } }, -- Autotags <div>|</div>
  { "JoosepAlviste/nvim-ts-context-commentstring", after = { "telescope.nvim" } },
  { -- Enhanced increment/decrement
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      require("lv-user/dial").config()
    end,
    opt = true,
  },
  { -- Peek changes live
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable "number" for the window while peeking
        show_cursorline = true, -- Enable "cursorline" for the window while peeking
      }
    end,
  },
  { -- smooth scroll
    "karb94/neoscroll.nvim",
    event = "BufRead",
    config = function()
      require "lv-user/neoscroll"
    end,
  },
  { -- Interactive scratchpad
    "metakirby5/codi.vim",
    ft = { "python", "javascript", "typescript", "php", "lua" },
--     setup = function()
--       lvim.builtin.which_key["y"] = { "<cmd>Codi<CR>", "Codi" }
--       lvim.builtin.which_key["Y"] = { "<cmd>Codi!<CR>", "Clear Codi" }
--     end,
    event = "BufRead",
  },
  { -- Symbol lvimutline
    "simrat39/symbols-outline.nvim",
--     setup = function()
--       lvim.builtin.which_key["l"] = { o = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" } }
--     end,
    event = "BufRead",
  },
  { -- floating terminal
    "voldikss/vim-floaterm",
    config = function()
      require "lv-user/floaterm"
    end,
  },
  { -- better (IMHlvim) hop, sneak, quickscope
    "ggandor/lightspeed.nvim",
    config = function()
      require "lv-user/lightspeed"
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
    "folke/tokyonight.nvim",
    config = function()
      require "lv-user/tokyonight"
    end,
  },
  { "Shatur/neovim-ayu", event = "BufEnter" }, -- ayu colorscheme
  { "Mofiqul/dracula.nvim", event = "BufEnter" }, -- dracula colorsheme
  {
    "Pocco81/TrueZen.nvim",
    setup = function()
      vim.api.nvim_set_keymap("n", "<M-=>", ":TZFocus<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<M-=>", "<C-\\><C-n>:TZFocus<cr>i", { noremap = true, silent = true })
--       lvim.builtin.which_key["z"] = { "<cmd>TZAtaraxis<CR>", "Zen Mode" }
    end,
    event = "BufRead",
  },
  {
    "akinsho/nvim-bufferline.lua",
    config = function()
      require("lv-user/bufferline").config()
    end,
  },
  {
    "monsonjeremy/onedark.nvim",
    event = "BufRead",
    config = function()
      require "lv-user/onedark"
    end,
  },
  {
    "yong1le/darkplus.nvim",
    event = "BufRead",
  },
  { -- diagnostics
    "folke/trouble.nvim",
    config = function()
      require("lv-user/trouble").config()
    end,
    event = "BufRead",
  },
  -- -- Tabnine
  -- {
  --   "tzachar/compe-tabnine",
  --   event = "BufRead",
  --   run = "./install.sh",
  --   requires = "hrsh7th/nvim-compe",
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
  { "TermOpen", "*", "startinsert" },
  { "TermOpen", "*", "setlocal nonumber norelativenumber" },
  { "TermOpen", "*", "nnoremap <buffer> <C-c> i<C-c>" },
  -- Set additional filetypes
  { "BufRead,BufNewFile", "*.asm", "setf nasm" },
  { "BufRead,BufNewFile", "*.conf", "setf conf" },
  { "BufRead,BufNewFile", "*.csv", "setf csv" },
  { "BufRead,BufNewFile", "*.fish", "setf fish" },
  { "BufRead,BufNewFile", "*.h", "setf c" },
  { "BufRead,BufNewFile", "*.list", "setf conf" },
  { "BufRead,BufNewFile", "*.snippets", "setf snippets" },
  { "BufRead,BufNewFile", "LICENSE", "setf LICENSE" },
}

-- lvim.builtin.which_key["S"] = {
--   name = "Session",
--   s = { "<cmd>SessionSave<cr>", "Save Session" },
--   l = { "<cmd>SessionLoad<cr>", "Load Session" },
-- }
-- lvim.builtin.which_key["?"] = { "<cmd>NvimTreeFindFile<CR>", "Open current dir" }

lvim.builtin.dashboard.custom_header = {
  "   ____              ______ _____ ____ ",
  "  / __ \\____  ____ _/ / __ / ___// __ \\",
  " / / / / __ \\/ __ `/ / __  \\__ \\/ / / /",
  "/ /_/ / /_/ / /_/ / / /_/ ___/ / /_/ / ",
  "\\____/ .___/\\__,_/_/_____/____/_____/  ",
  "    /_/                                ",
}

-- Neovim turns the default cursor to 'Block'  -- when switched back into terminal.  -- This below line fixes that. Uncomment if needed.
vim.cmd "autocmd VimLeave,VimSuspend * set guicursor=a:ver90"
-- vim.cmd('autocmd VimLeave,VimSuspend * set guicursor=a:hor20') -- Underline

-- NlvimTE: Above code doesn't take a value from the terminal's cursor and
--       replace it. It hardcodes the cursor shape.
--       And I think `ver` means vertical and `hor` means horizontal.
--       The numbers didn't make a difference in alacritty. Please change
--       the number to something that suits your needs if it looks weird.
