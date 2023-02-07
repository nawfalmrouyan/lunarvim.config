lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "catppuccin"
lvim.builtin.lualine.options.theme = "catppuccin"
lvim.shell = "/usr/bin/zsh"
lvim.transparent_window = true

vim.opt.cmdheight = 0
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
vim.opt.guifont = "Iosevka Medium:h9"
vim.opt.colorcolumn = "100"

lvim.builtin.lualine.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.bufferline.options.show_buffer_close_icons = false
lvim.builtin.bufferline.options.show_close_icon = false
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.dap.active = false
lvim.builtin.terminal.active = true
lvim.builtin.indentlines.active = true
lvim.builtin.illuminate.active = true

lvim.lsp.diagnostics.virtual_text = false

lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "css",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "html",
  "javascript",
  "json",
  "lua",
  "python",
  "svelte",
  "terraform",
  "typescript",
  "yaml",
}
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
  "yamlfmt",
  "yamllint",
  "yamlls",
  "zk",
}

lvim.builtin.telescope.theme = "center"
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "fzy_native")
  pcall(telescope.load_extension, "zk")
  pcall(telescope.load_extension, "frecency")
  pcall(telescope.load_extension, "notify")
end

lvim.builtin.autopairs.active = false
lvim.builtin.cmp.cmdline.enable = true
lvim.builtin.cmp.experimental.ghost_text = true
lvim.builtin.luasnip.sources.friendly_snippets = true

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
    enable = false,
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
  "pyre",
  "quick_lint_js",
  "reason_ls",
  "rnix",
  "rome",
  "ruby_ls",
  "ruff_lsp",
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
  "vtsls",
  "vuels",
}

-- Personal Keymaps
lvim.keys.insert_mode["<M-o>"] = "<C-o>o"
lvim.keys.insert_mode["<M-O>"] = "<C-o>O"
lvim.keys.normal_mode["<M-w>"] = ":set wrap! wrap?<cr>"
lvim.keys.normal_mode["<M-r>"] = ":set relativenumber! relativenumber?<cr>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<cr>"
-- lvim.keys.normal_mode["<TAB>"] = ":BufferLinePick<cr>"
lvim.keys.normal_mode["<M-o>"] = "o<esc>"
lvim.keys.normal_mode["<M-O>"] = "O<esc>"
lvim.keys.normal_mode["<M-$>"] = "g$"
lvim.keys.normal_mode["/"] = "ms/"

-- From the primeagen
-- lvim.keys.normal_mode["J"] = "mzJ`z"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["Q"] = "<nop>"
-- lvim.keys.normal_mode["<leader>x"] = "<cmd>!chmod +x %<cr>"
lvim.builtin.which_key.mappings["x"] = { "<CMD>!chmod +x %<CR>", "Make it executable" }

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
    "Exafunction/codeium.vim",
    event = "BufRead",
    lazy = true,
    init = function()
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },
  {
    "Aasim-A/scrollEOF.nvim",
    event = "BufRead",
    lazy = true,
    config = function()
      require("scrollEOF").setup {}
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufRead",
    lazy = true,
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("user.nvim-ufo").config()
    end,
  },
  {
    "eandrju/cellular-automaton.nvim",
    event = "BufRead",
    lazy = true,
    init = function()
      lvim.builtin.which_key.mappings["ml"] = { "<CMD>CellularAutomaton make_it_rain<CR>", "Make it RAIN" }
    end,
  },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    init = function()
      lvim.builtin.which_key.mappings["sn"] = { "<CMD>Telescope notify<CR>", "Notifications history" }
    end,
    config = function()
      require("notify").setup { stages = "fade", render = "compact" }
    end,
  },
  {
    "mrded/nvim-lsp-notify",
    lazy = true,
    config = function()
      require("lsp-notify").setup {}
    end,
  },
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup {
        lsp = {
          signature = { enabled = false },
          hover = { enabled = false },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = false, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = true, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      }
    end,
    dependencies = { "MunifTanjim/nui.nvim" },
  },
  { "preservim/vim-markdown", ft = "markdown", dependencies = "godlygeek/tabular" },
  {
    "nvim-telescope/telescope-frecency.nvim",
    event = "BufRead",
    lazy = true,
    init = function()
      lvim.builtin.which_key.mappings["so"] =
        { "<CMD>lua require('telescope').extensions.frecency.frecency()<CR>", "Frecency" }
      lvim.builtin.which_key.mappings["sO"] = {
        "<CMD>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>",
        "Current Workspace Frecency",
      }
      local dashentry = lvim.builtin.alpha.dashboard.section.buttons.entries
      local entry = {
        "y",
        lvim.icons.ui.History .. "  Frecency files",
        "<CMD>lua require('telescope').extensions.frecency.frecency()<CR>",
      }
      -- table.remove(dashentry, 4)
      table.insert(dashentry, 5, entry)
    end,
    dependencies = { "kkharji/sqlite.lua" },
  },
  {
    "hrsh7th/nvim-insx",
    event = "InsertEnter",
    lazy = true,
    config = function()
      require("insx.preset.standard").setup()
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    ft = { "html", "typescript", "javascript", "svelte", "css", "javascriptreact", "typescriptreact" },
    lazy = true,
    init = function()
      lvim.builtin.cmp.formatting = {
        format = require("tailwindcss-colorizer-cmp").formatter,
      }
    end,
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },
  {
    "chrisgrieser/nvim-recorder",
    event = "BufRead",
    lazy = true,
    config = function()
      require("recorder").setup {
        -- Named registers where macros are saved. The first register is the default
        -- register/macro-slot used after startup.
        slots = { "a", "b" },

        -- default keymaps, see README for description what the commands do
        mapping = {
          startStopRecording = "q",
          playMacro = "Q",
          switchSlot = "<C-q>",
          editMacro = "cq",
          yankMacro = "yq", -- also decodes it for turning macros to mappings
          addBreakPoint = "##", -- ⚠️ this should be a string you don't use in insert mode during a macro
        },

        -- clears all macros-slots on startup
        clear = false,

        -- log level used for any notification, mostly relevant for nvim-notify
        -- (note that by default, nvim-notify does not show the levels trace and debug.)
        logLevel = vim.log.levels.INFO,

        -- experimental, see README
        dapSharedKeymaps = false,
      }

      lvim.builtin.lualine.sections.lualine_y = { { require("recorder").displaySlots } }
      lvim.builtin.lualine.sections.lualine_z = { { require("recorder").recordingStatus } }
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    event = "BufRead",
    lazy = true,
    config = function()
      local cfg = { order = "FNSs", setopt = true }
      require("statuscol").setup(cfg)
    end,
  },
  { "kmonad/kmonad-vim", ft = "kbd", lazy = true },
  {
    "glacambre/firenvim",
    lazy = true,
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    init = function()
      vim.cmd [[
        let g:firenvim_config = { 
          \ 'globalSettings': {
            \ 'alt': 'all',
          \  },
          \ 'localSettings': {
            \ '.*': {
              \ 'cmdline': 'neovim',
              \ 'content': 'text',
              \ 'priority': 0,
              \ 'selector': 'textarea',
              \ 'takeover': 'always',
            \ },
          \ }
        \ }
        let fc = g:firenvim_config['localSettings']
        " let fc['https?://[^/]+\.co\.uk/'] = { 'takeover': 'never', 'priority': 1 }
        let fc['https?://camsyscrm\.mmu\.edu\.my/'] = { 'takeover': 'never', 'priority': 1 }
        function! OnUIEnter(event) abort
          if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
            set laststatus=0
          endif
        endfunction
        autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
        au BufEnter github.com_*.txt set filetype=markdown
        ]]
    end,
  },
  {
    "ckolkey/ts-node-action",
    event = "BufRead",
    lazy = true,
    dependencies = { "nvim-treesitter" },
    init = function()
      vim.keymap.set({ "n" }, "<TAB>", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
    end,
  },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    cmd = "Neorg",
    lazy = true,
    build = ":Neorg sync-parsers",
    config = function()
      require("user.neorg").config()
    end,
    dependencies = { "nvim-neorg/neorg-telescope", "nvim-lua/plenary.nvim" },
  },
  {
    "simrat39/symbols-outline.nvim",
    event = "BufRead",
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    lazy = true,
    init = function()
      lvim.builtin.which_key.mappings["lo"] = { "<cmd>SymbolsOutline<cr>", "Outline" }
    end,
    config = function()
      -- require("user.symbolsoutline").config()
      require("symbols-outline").setup {
        symbols = {
          File = { hl = "@text.uri" },
          Module = { hl = "@namespace" },
          Namespace = { hl = "@namespace" },
          Package = { hl = "@namespace" },
          Class = { hl = "@type" },
          Method = { hl = "@method" },
          Property = { hl = "@method" },
          Field = { hl = "@field" },
          Constructor = { hl = "@constructor" },
          Enum = { hl = "@type" },
          Interface = { hl = "@type" },
          Function = { hl = "@function" },
          Variable = { hl = "@constant" },
          Constant = { hl = "@constant" },
          String = { hl = "@string" },
          Number = { hl = "@number" },
          Boolean = { hl = "@boolean" },
          Array = { hl = "@constant" },
          Object = { hl = "@type" },
          Key = { hl = "@type" },
          Null = { hl = "@type" },
          EnumMember = { hl = "@field" },
          Struct = { hl = "@type" },
          Event = { hl = "@type" },
          Operator = { hl = "@operator" },
          TypeParameter = { hl = "@parameter" },
        },
      }
    end,
  },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    lazy = true,
    config = function()
      local tabnine = require "cmp_tabnine.config"

      tabnine:setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = "..",
        ignored_file_types = {
          -- lua = true
        },
        show_prediction_strength = false,
      }
    end,
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "BufRead",
    lazy = true,
    config = function()
      require("various-textobjs").setup { useDefaultKeymaps = true }
    end,
  },
  {
    "echasnovski/mini.basics",
    event = "BufRead",
    lazy = true,
    version = false,
    config = function()
      require("mini.basics").setup {
        options = {
          basic = true,
          extra_ui = true,
          win_borders = "bold",
        },
        mappings = {
          basic = true,
          option_toggle_prefix = [[\]],
          windows = false,
          move_with_alt = false,
        },
        autocommands = {
          basic = true,
          relnum_in_visual_mode = false,
        },
      }
    end,
  },
  {
    "echasnovski/mini.map",
    event = "BufRead",
    lazy = true,
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
  { "mattn/vim-gist", event = "BufRead", dependencies = "mattn/webapi-vim" },
  {
    "max397574/better-escape.nvim",
    event = "BufRead",
    lazy = true,
    config = function()
      require("better_escape").setup {
        mapping = { "jk", "jj", "kj" },
      }
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    lazy = true,
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase" },
        lastplace_open_folds = true,
      }
    end,
  },
  { "RRethy/nvim-treesitter-textsubjects", event = "BufRead", before = "nvim-treesitter" },
  {
    "mbbill/undotree",
    event = "BufRead",
    lazy = true,
    init = function()
      lvim.builtin.which_key.mappings["u"] = { "<cmd>UndotreeToggle<cr>", "Undo" }
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufRead",
    lazy = true,
    init = function()
      lvim.builtin.which_key.mappings["S"] = {
        name = "Session",
        c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
        l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
        Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
      }
      local entry = {
        "s",
        lvim.icons.ui.Fire .. "  Restore last session",
        "<CMD>lua require('persistence').load({ last = true })<CR>",
      }
      table.insert(lvim.builtin.alpha.dashboard.section.buttons.entries, 7, entry)
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
    event = "BufRead",
    lazy = true,
    config = function()
      require("user.treesitter-context").config()
    end,
  },
  {
    "lmburns/lf.nvim",
    cmd = "Lf",
    lazy = true,
    init = function()
      lvim.builtin.which_key.mappings["r"] = { "<cmd>Lf<cr>", "File Manager" }
    end,
    config = function()
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
    lazy = true,
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    lazy = true,
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
  { "p00f/nvim-ts-rainbow", event = "BufRead", lazy = true },
  { "windwp/nvim-ts-autotag", event = "InsertEnter", lazy = true },
  { "romgrk/fzy-lua-native", build = "make" },
  { "nvim-telescope/telescope-fzy-native.nvim" },
  {
    "mg979/vim-visual-multi",
    event = "BufRead",
    lazy = true,
    init = function()
      vim.cmd "let g:VM_default_mappings = 0"
    end,
  }, -- vim -Nu ~/.local/share/lunarvim/site/pack/packer/start/vim-visual-multi/tutorialrc
  { "nvim-treesitter/nvim-treesitter-textobjects", before = "nvim-treesitter", event = "BufRead", lazy = true },
  {
    "echasnovski/mini.ai",
    event = "BufRead",
    lazy = true,
    config = function()
      require("mini.ai").setup {
        -- Table with textobject id as fields, textobject specification as values.
        -- Also use this to disable builtin textobjects. See |MiniAi.config|.
        custom_textobjects = nil,

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Main textobject prefixes
          around = "a",
          inside = "i",

          -- Next/last variants
          around_next = "an",
          inside_next = "in",
          around_last = "al",
          inside_last = "il",

          -- Move cursor to corresponding edge of `a` textobject
          goto_left = "g[",
          goto_right = "g]",
        },

        -- Number of lines within which textobject is searched
        n_lines = 50,

        -- How to search for object (first inside current line, then inside
        -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
        -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
        search_method = "cover_or_nearest",
      }
    end,
  },
  {
    "echasnovski/mini.move",
    event = "BufRead",
    lazy = true,
    init = function()
      lvim.keys.insert_mode["<A-j>"] = nil
      lvim.keys.insert_mode["<A-k>"] = nil
      lvim.keys.normal_mode["<A-j>"] = nil
      lvim.keys.normal_mode["<A-k>"] = nil
      lvim.keys.visual_block_mode["<A-j>"] = nil
      lvim.keys.visual_block_mode["<A-k>"] = nil
    end,
    config = function()
      require("mini.move").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "BufRead",
    lazy = true,
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
  -- {
  --   "roobert/surround-ui.nvim",
  --   dependencies = {
  --     "kylechui/nvim-surround",
  --     "folke/which-key.nvim",
  --   },
  --   config = function()
  --     require("surround-ui").setup {
  --       root_key = "gz",
  --     }
  --   end,
  -- },
  {
    "ellisonleao/glow.nvim",
    ft = "markdown",
    cmd = "Glow",
    lazy = true,
    init = function()
      lvim.builtin.which_key.mappings["mg"] = { "<cmd>Glow<cr>", "Glow Markdown Preview" }
    end,
    config = function()
      require("glow").setup {
        border = "rounded",
      }
    end,
  },
  {
    "mickael-menu/zk-nvim",
    cmd = {
      "ZkNewFromTitleSelection",
      "ZkNewFromContentSelection",
      "ZkNotes",
      "ZkTags",
      "ZkMatch",
      "ZkNew",
    },
    ft = "markdown",
    lazy = true,
    init = function()
      lvim.builtin.which_key.vmappings["z"] = {
        name = "Zettelkasten",
        c = { ":'<'>ZkNewFromContentSelection<CR>" },
        l = { ":'<'>ZkInsertLinkAtSelection { matchSelected = true }<CR>", "Insert link using selected text" },
        s = { ":'<'>ZkMatch<CR>", "Search using selected text" },
        t = { ":'<'>ZkNewFromTitleSelection<CR>", "New note with selection as Title" },
      }
      lvim.builtin.which_key.mappings["z"] = {
        name = "Zettelkasten",
        f = {
          name = "Find notes",
          n = { "<cmd>ZkNotes<CR>", "List all notes" },
          o = { "<cmd>ZkOrphans<CR>", "List orphans" },
          r = { "<cmd>ZkRecents<CR>", "List recents" },
          t = { "<cmd>ZkTags<CR>", "List all tags" },
        },
        l = {
          name = "Links",
          b = { "<cmd>ZkBacklinks<CR>", "List backlinks" },
          i = { "<cmd>ZkInsertLink<CR>", "Insert link" },
          l = { "<cmd>ZkLinks<CR>", "List links" },
        },
        n = {
          name = "New Note",
          f = { "<cmd>ZkNew { dir = 'fleeting' }<CR>", "New fleeting note" },
          l = { "<cmd>ZkNew { dir = 'literature' }<CR>", "New literature note" },
          p = { "<cmd>ZkNew { dir = 'permanent' }<CR>", "New permanent note" },
        },
      }
    end,
    config = function()
      require("user.zk-nvim").config()
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    build = ":CatppuccinCompile",
    config = function()
      require("user.catppuccin").config()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    lazy = true,
    build = "cd app && npm install",
    init = function()
      lvim.builtin.which_key.mappings["m"] =
        { name = "Markdown & Minimap", M = { "<cmd>MarkdownPreview<cr>", "Markdown Preview" } }
    end,
    config = function()
      vim.g.mkdp_browser = "firefoxMD"
    end,
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    lazy = true,
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    config = function()
      require("colorizer").setup {
        filetypes = {
          "html",
          "conf",
          "css",
          "svelte",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        user_default_options = {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = true, -- "Name" codes like Blue or blue
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          AARRGGBB = true, -- 0xAARRGGBB hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes for `mode`: foreground, background,  virtualtext
          mode = "background", -- Set the display mode.
          -- Available methods are false / true / "normal" / "lsp" / "both"
          -- True is same as normal
          tailwind = true, -- Enable tailwind colors
          -- parsers can contain values used in |user_default_options|
          -- sass = { enable = true, parsers = { css } }, -- Enable sass colors
          virtualtext = "■",
        },
        -- all the sub-options of filetypes apply to buftypes
        buftypes = {
          "*",
          -- exclude prompt and popup buftypes from highlight
          "!prompt",
          "!popup",
        },
      }
    end,
  },
  {
    "f-person/git-blame.nvim",
    cmd = "GitBlameToggle",
    lazy = true,
    init = function()
      lvim.builtin.which_key.mappings["a"] = { "<cmd>GitBlameToggle<cr>", "Toggle Git Blame" }
      vim.g.gitblame_enabled = 0
    end,
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
    end,
  },
  {
    "monaqa/dial.nvim",
    event = "BufRead",
    lazy = true,
    config = function()
      require("user.dial").config()
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    lazy = true,
    config = function()
      require("user.numb").config()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "BufEnter",
    lazy = false,
    config = function()
      require("user.neoscroll").config()
    end,
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
    lazy = true,
    ft = { "python", "javascript", "php" },
    init = function()
      lvim.builtin.which_key.mappings["y"] = { "<cmd>Codi<cr>", "Codi" }
      lvim.builtin.which_key.mappings["Y"] = { "<cmd>Codi!<cr>", "Clear Codi" }
    end,
  },
  {
    "ggandor/leap.nvim",
    event = "BufRead",
    lazy = true,
    config = function()
      require("leap").set_default_keymaps()
    end,
  },
  {
    "ggandor/flit.nvim",
    lazy = true,
    dependencies = "ggandor/leap.nvim",
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
    event = "BufRead",
    lazy = true,
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
    lazy = true,
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
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "Pocco81/true-zen.nvim",
    cmd = { "TZFocus", "TZAtaraxis" },
    lazy = true,
    init = function()
      lvim.builtin.which_key.mappings["Z"] =
        { name = "Zen", Z = { "<cmd>TZAtaraxis<cr>", "Zen Mode" }, f = { "<cmd>TZFocus<cr>", "Focus window" } }
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
    lazy = true,
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
    "j-hui/fidget.nvim",
    event = "BufRead",
    lazy = true,
    config = function()
      require("fidget").setup()
    end,
  },
  { "christoomey/vim-tmux-navigator", event = "BufRead", lazy = true },
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
  { "ColorScheme", { pattern = { "*" }, command = "hi Cursor guifg=red guibg=red" } },
  { "ColorScheme", { pattern = { "*" }, command = "hi NotifyBackground guibg='#000000'" } },
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

vim.opt.guicursor = {
  "n-v:block-block-Cursor/lCursor",
  "i-c-ci-ve:ver25-Cursor/lCursor",
  "r-cr:hor20",
  "o:hor50",
  "i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  "sm:block-blinkwait175-blinkoff150-blinkon175",
}

vim.filetype.add {
  filename = {
    [".env"] = "config",
    [".todo"] = "txt",
  },
  pattern = {
    ["req.*.txt"] = "config",
    ["gitconf.*"] = "gitconfig",
  },
}
-- ]]
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
