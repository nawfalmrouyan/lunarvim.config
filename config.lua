-- lvim.log.level = "warn"
lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "duskfox"
lvim.shell = "/usr/bin/zsh"
-- lvim.transparent_window = true

vim.opt.cmdheight = 1
vim.opt.timeoutlen = 500
vim.opt.ignorecase = false
vim.opt.smartcase = false
vim.opt.guifont = "OpalSlab:h16"
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = { eol = "¬", trail = "·", precedes = "…", extends = "…", tab = "→\\ " }
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 0
vim.opt.inccommand = "split"
vim.cmd "set foldmethod=manual"
vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"

lvim.builtin.lualine.active = false
lvim.builtin.bufferline.active = true
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.dap.active = false
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 10
lvim.builtin.terminal.shading_factor = 1
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- lvim.builtin.dashboard.custom_section.g = { description = { "  Notes              " }, command = "ZkNotes" }

lvim.lsp.diagnostics.virtual_text = false

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.autotag.enable = true

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

-- Remove tailwindcss from lvim.lsp.override table
table.remove(lvim.lsp.override, 31) -- stylelint_lsp
table.remove(lvim.lsp.override, 31) -- tailwindcss
table.remove(lvim.lsp.override, 35) -- zk

-- Personal Keymaps
lvim.keys.insert_mode["<M-o>"] = "<C-o>o"
lvim.keys.insert_mode["<M-O>"] = "<C-o>O"
lvim.keys.normal_mode["<M-w>"] = ":set wrap! wrap?<cr>"
lvim.keys.normal_mode["<M-r>"] = ":set relativenumber! relativenumber?<cr>"
-- disable default keybindings for H/L
lvim.keys.normal_mode["<S-h>"] = false
lvim.keys.normal_mode["<S-l>"] = false
lvim.keys.normal_mode["<TAB>"] = ":BufferLinePick<CR>"
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
  { "nathom/filetype.nvim" },
  { "tpope/vim-surround", event = "BufRead" },
  { "michaeljsmith/vim-indent-object", event = "BufRead" },
  { "tweekmonster/startuptime.vim" },
  { "kevinhwang91/nvim-bqf", event = "BufRead" },
  { "tpope/vim-repeat", event = "BufRead" },
  { "p00f/nvim-ts-rainbow", event = "BufEnter" },
  { "windwp/nvim-ts-autotag", event = "InsertEnter" },
  { "romgrk/fzy-lua-native" },
  { "nvim-telescope/telescope-fzy-native.nvim", run = "make" },
  { "nvim-treesitter/nvim-treesitter-textobjects", before = "nvim-treesitter" },
  { "wellle/targets.vim" },
  -- {
  --   "glacambre/firenvim",
  --   run = function()
  --     vim.fn["firenvim#install"](0)
  --   end,
  -- },
  {
    "subnut/nvim-ghost.nvim",
    run = function()
      vim.fn["nvim_ghost#installer#install"]()
    end,
  },
  {
    "mickael-menu/zk-nvim",
    config = function()
      require("zk").setup {
        picker = "telescope",
        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
          },
        },
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      }

      local zk = require "zk"
      local commands = require "zk.commands"

      local function make_edit_fn(defaults, picker_options)
        return function(options)
          options = vim.tbl_extend("force", defaults, options or {})
          zk.edit(options, picker_options)
        end
      end

      commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
      commands.add("ZkRecents", make_edit_fn({ createdAfter = "2 weeks ago" }, { title = "Zk Recents" }))

      require("telescope").load_extension "zk"
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      local nightfox = require "nightfox"
      nightfox.setup {
        styles = {
          comments = "italic",
          keywords = "bold",
          functions = "italic,bold",
        },
      }
      nightfox.load()
    end,
  },
  { "iamcco/markdown-preview.nvim", run = "cd app && npm install", ft = "markdown" },
  {
    "ThePrimeagen/harpoon",
    setup = function()
      lvim.builtin.which_key.mappings["o"] = {
        name = "Harpoon",
        m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle Quick Menu" },
        a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
        j = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Navigate to File 1" },
        k = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Navigate to File 2" },
        l = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Navigate to File 3" },
        t = { "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "Go to Terminal 1" },
      }
    end,
  },
  {
    "hrsh7th/cmp-cmdline",
    config = function()
      require("cmp").setup.cmdline(":", { sources = { { name = "cmdline" } } })
      require("cmp").setup.cmdline("/", { sources = { { name = "buffer" } } })
    end,
  },
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
    event = "BufRead",
  },
  {
    "mbbill/undotree",
    event = "BufRead",
    setup = function()
      lvim.builtin.which_key.mappings["u"] = { "<cmd>UndotreeToggle<CR>", "Undo Tree" }
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
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("user.colorizer").config()
    end,
    event = "BufRead",
  },
  {
    "f-person/git-blame.nvim",
    setup = function()
      lvim.builtin.which_key.mappings["a"] = { "<cmd>GitBlameToggle<CR>", "Toggle Git Blame" }
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
  { -- better (IMHO) hop, sneak, quickscope
    "ggandor/lightspeed.nvim",
    commit = "74408c69cc92d74fc450811372675562826d6f2f",
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
      vim.api.nvim_set_keymap("t", "<M-=>", "<C-\\><C-n>:TZFocus<cr>", { noremap = true, silent = true })
      lvim.builtin.which_key.mappings["Z"] = { "<cmd>TZAtaraxis<CR>", "Zen Mode" }
    end,
    event = "BufRead",
  },
  { -- diagnostics
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    setup = function()
      lvim.builtin.which_key.mappings.l.t = { "<cmd>TroubleToggle<CR>", "Trouble" }
    end,
  },
  -- {
  --   "nvim-neorg/neorg",
  --   config = function()
  --     require("neorg").setup {
  --       -- Tell Neorg what modules to load
  --       load = {
  --         ["core.defaults"] = {}, -- Load all the default modules
  --         ["core.keybinds"] = { -- Configure core.keybinds
  --           config = {
  --             default_keybinds = true, -- Generate the default keybinds
  --             neorg_leader = "<Leader>o", -- This is the default if unspecified
  --           },
  --         },
  --         ["core.norg.concealer"] = {}, -- Allows for use of icons
  --         ["core.norg.dirman"] = { -- Manage your directories with Neorg
  --           config = {
  --             workspaces = {
  --               my_workspace = "~/neorg",
  --             },
  --           },
  --         },
  --         ["core.integrations.telescope"] = {},
  --         ["core.norg.completion"] = {
  --           config = {
  --             engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
  --           },
  --         },
  --       },
  --     }
  --     table.insert(lvim.builtin.cmp.sources, { name = "neorg" })

  --     local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
  --     parser_configs.norg = {
  --       install_info = {
  --         url = "https://github.com/nvim-neorg/tree-sitter-norg",
  --         files = { "src/parser.c", "src/scanner.cc" },
  --         branch = "main",
  --       },
  --     }
  --     parser_configs.norg_meta = {
  --       install_info = {
  --         url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
  --         files = { "src/parser.c" },
  --         branch = "main",
  --       },
  --     }
  --     parser_configs.norg_table = {
  --       install_info = {
  --         url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
  --         files = { "src/parser.c" },
  --         branch = "main",
  --       },
  --     }
  --   end,
  --   requires = "vhyrro/neorg-telescope",
  -- },
}

lvim.autocommands.custom_groups = {
  {
    "InsertEnter",
    "*",
    "if &relativenumber | let g:backtorelative = 1 | setlocal number norelativenumber nocursorline | endif",
  },
  { "InsertLeave", "*", 'if exists("g:backtorelative") | setlocal relativenumber cursorline | endif' },
  { "WinEnter", "*", "setlocal cursorline" },
  { "WinLeave", "*", "setlocal nocursorline" },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  s = { "<cmd>SessionSave<cr>", "Save Session" },
  l = { "<cmd>SessionLoad<cr>", "Load Session" },
}
lvim.builtin.which_key.mappings["?"] = { "<cmd>NvimTreeFindFile<CR>", "Open current dir" }
lvim.builtin.which_key.mappings["c"] = { "<cmd>bdelete!<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["z"] = {
  name = "Zk",
  l = { "<cmd>ZkNotes<CR>", "All Notes" },
  nf = { "<cmd>ZkNew {dir='fleeting'}<CR>", "New fleeting note" },
  nl = { "<cmd>ZkNew {dir='literature'}<CR>", "New literature note" },
  np = { "<cmd>ZkNew {dir='permanent'}<CR>", "New permanent note" },
  o = { "<cmd>ZkOrphans<CR>", "Orphan notes" },
  r = { "<cmd>ZkRecents<CR>", "Recent notes" },
  t = { "<cmd>ZkTags<CR>", "Tags" },
  f = { "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>" },
}

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
--
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
