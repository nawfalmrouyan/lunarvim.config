lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "duskfox"
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
-- vim.cmd "set foldmethod=manual"
-- vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"
vim.cmd "set foldoptions=nodigits"
vim.go.laststatus = 3

lvim.builtin.lualine.active = true
lvim.builtin.lualine.options.globalstatus = true
lvim.builtin.lualine.options.theme = "duskfox"
lvim.builtin.bufferline.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.dap.active = false
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 10
lvim.builtin.terminal.shading_factor = 1
lvim.builtin.which_key.mappings["P"] = { "<CMD>Telescope projects<CR>", "Projects" }
lvim.builtin.notify.opts.timeout = 500

lvim.lsp.automatic_servers_installation = true
lvim.lsp.diagnostics.virtual_text = false

-- lvim.builtin.treesitter.ensure_installed = "maintained"
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
  "grammarly",
  "graphql",
  "jedi_language_server",
  "ltex",
  "ocamlls",
  "phpactor",
  "psalm",
  "pylsp",
  "quick_lint_js",
  "reason_ls",
  "remark_ls",
  "rome",
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
  "verible",
  "vuels",
  "zeta_note",
  -- "zk",
}

-- Personal Keymaps
lvim.keys.insert_mode["<M-o>"] = "<C-o>o"
lvim.keys.insert_mode["<M-O>"] = "<C-o>O"
lvim.keys.normal_mode["<M-w>"] = ":set wrap! wrap?<cr>"
lvim.keys.normal_mode["<M-r>"] = ":set relativenumber! relativenumber?<cr>"
-- disable default keybindings for H/L
lvim.keys.normal_mode["<S-h>"] = false
lvim.keys.normal_mode["<S-l>"] = false
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
  { "michaeljsmith/vim-indent-object", event = "BufRead" },
  { "tweekmonster/startuptime.vim" },
  { "kevinhwang91/nvim-bqf", event = "BufRead" },
  { "p00f/nvim-ts-rainbow", event = "BufEnter" },
  { "windwp/nvim-ts-autotag", event = "InsertEnter" },
  { "romgrk/fzy-lua-native" },
  { "nvim-telescope/telescope-fzy-native.nvim", run = "make" },
  { "mg979/vim-visual-multi" }, -- vim -Nu ~/.local/share/lunarvim/site/pack/packer/start/vim-visual-multi/tutorialrc
  { "nvim-treesitter/nvim-treesitter-textobjects", before = "nvim-treesitter" },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
    config = function()
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = "1"
      vim.wo.foldlevel = 99 -- feel free to decrease the value
      vim.wo.foldenable = true

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = {} -- like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require("lspconfig")[ls].setup {
          capabilities = capabilities,
          -- other_fields = ...,
        }
      end

      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ("  %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end

      -- global handler
      require("ufo").setup {
        fold_virt_text_handler = handler,
      }

      -- buffer scope handler
      -- will override global handler if it is existed
      local bufnr = vim.api.nvim_get_current_buf()
      require("ufo").setFoldVirtTextHandler(bufnr, handler)
    end,
  },
  {
    "gelfand/copilot.vim",
    disable = not lvim.builtin.sell_soul_to_devel,
    config = function()
      -- copilot assume mapped
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "hrsh7th/cmp-copilot",
    disable = not lvim.builtin.sell_soul_to_devel,
    config = function()
      lvim.builtin.cmp.formatting.source_names["copilot"] = "(Cop)"
      table.insert(lvim.builtin.cmp.sources, { name = "copilot" })
    end,
  },
  {
    "ellisonleao/glow.nvim",
    config = function()
      vim.g.glow_border = "rounded"
      lvim.builtin.which_key.mappings["m"] = { "<CMD>Glow<CR>", "Markdown Preview" }
    end,
    -- ft = "markdown",
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
  },
  { "olimorris/onedarkpro.nvim" },
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
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("user.lsp_signature").config()
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
    setup = function()
      lvim.builtin.which_key.mappings["y"] = { "<CMD>Codi<CR>", "Codi" }
      lvim.builtin.which_key.mappings["Y"] = { "<CMD>Codi!<CR>", "Clear Codi" }
    end,
  },
  { -- Symbol Outline
    "simrat39/symbols-outline.nvim",
    setup = function()
      lvim.builtin.which_key.mappings.l.o = { "<CMD>SymbolsOutline<cr>", "Outline" }
    end,
    event = "BufRead",
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
    "Pocco81/TrueZen.nvim",
    setup = function()
      vim.api.nvim_set_keymap("n", "<M-=>", ":TZFocus<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<M-=>", "<C-\\><C-n>:TZFocus<cr>", { noremap = true, silent = true })
      lvim.builtin.which_key.mappings["Z"] = { "<CMD>TZAtaraxis<CR>", "Zen Mode" }
    end,
    event = "BufRead",
  },
  { -- diagnostics
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    setup = function()
      lvim.builtin.which_key.mappings.l.t = { "<CMD>TroubleToggle<CR>", "Trouble" }
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
}

-- lvim.builtin.which_key.mappings["S"] = {
--   name = "Session",
--   s = { "<CMD>SessionSave<cr>", "Save Session" },
--   l = { "<CMD>SessionLoad<cr>", "Load Session" },
-- }
lvim.builtin.which_key.mappings["?"] = { "<CMD>NvimTreeFindFile<CR>", "Find file in NvimTree" }
lvim.builtin.which_key.mappings["c"] = { "<CMD>bdelete!<CR>", "Close Buffer" }

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
vim.cmd "autocmd VimLeave,VimSuspend * set guicursor=a:ver90" -- Beam
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
