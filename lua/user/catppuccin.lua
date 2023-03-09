local M = {}

M.config = function()
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    return
  end
  vim.g.catppuccin_flavour = "mocha"
  catppuccin.setup {
    dim_inactive = {
      enabled = true,
      shade = "dark",
      percentage = 0.15,
    },
    transparent_background = true,
    term_colors = true,
    compile = {
      enabled = true,
      path = vim.fn.stdpath "cache" .. "/catppuccin",
    },
    styles = {
      comments = { "italic" },
      conditionals = { "bold" },
      loops = { "italic" },
      functions = { "italic", "bold" },
      keywords = { "italic", "bold" },
      strings = { "italic" },
      variables = { "bold" },
      numbers = { "bold" },
      booleans = { "italic" },
      properties = { "italic" },
      types = { "italic" },
      operators = { "bold" },
    },
    require("catppuccin").setup {
      integrations = {
        aerial = false,
        barbar = false,
        beacon = false,
        cmp = true,
        coc_nvim = false,
        dashboard = true,
        fern = false,
        fidget = false,
        gitgutter = false,
        gitsigns = true,
        harpoon = false,
        hop = false,
        illuminate = true,
        leap = true,
        lightspeed = false,
        lsp_saga = false,
        lsp_trouble = true,
        markdown = true,
        mason = true,
        mini = true,
        neogit = false,
        neotest = false,
        neotree = false,
        notify = true,
        nvimtree = true,
        overseer = false,
        pounce = false,
        symbols_outline = false,
        telekasten = false,
        telescope = true,
        treesitter = true,
        treesitter_context = false,
        ts_rainbow = true,
        vim_sneak = false,
        vimwiki = false,
        which_key = true,

        -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
        dap = {
          enabled = true,
          enable_ui = true,
        },
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            -- hints = { "undercurl" },
            warnings = { "undercurl" },
            -- information = { "undercurl" },
          },
        },
        navic = {
          enabled = true,
          custom_bg = "NONE",
        },
      },
    },
    color_overrides = {},
    highlight_overrides = {
      --VS code cmp
      CmpItemKindConstructor = { fg = "#f28b25" },
      CmpItemKindUnit = { fg = "#D4D4D4" },
      CmpItemKindProperty = { fg = "#D4D4D4" },
      CmpItemKindKeyword = { fg = "#D4D4D4" },
      CmpItemKindMethod = { fg = "#C586C0" },
      CmpItemKindFunction = { fg = "#C586C0" },
      CmpItemKindColor = { fg = "#C586C0" },
      CmpItemKindText = { fg = "#9CDCFE" },
      CmpItemKindInterface = { fg = "#9CDCFE" },
      CmpItemKindVariable = { fg = "#9CDCFE" },
      CmpItemKindField = { fg = "#9CDCFE" },
      CmpItemKindValue = { fg = "#9CDCFE" },
      CmpItemKindEnum = { fg = "#9CDCFE" },
      CmpItemKindEnumMember = { fg = "#9CDCFE" },
      CmpItemKindStruct = { fg = "#9CDCFE" },
      CmpItemKindReference = { fg = "#9CDCFE" },
      CmpItemKindTypeParameter = { fg = "#9CDCFE" },
      CmpItemKindSnippet = { fg = "#D4D4D4" },
      CmpItemKindClass = { fg = "#f28b25" },
      CmpItemKindModule = { fg = "#D4D4D4" },
      CmpItemKindOperator = { fg = "#D4D4D4" },
      CmpItemKindConstant = { fg = "#D4D4D4" },
      CmpItemKindFile = { fg = "#D4D4D4" },
      CmpItemKindFolder = { fg = "#D4D4D4" },
      CmpItemKindEvent = { fg = "#D4D4D4" },
      CmpItemAbbrMatch = { fg = "#18a2fe", bold = true },
      CmpItemAbbrMatchFuzzy = { fg = "#18a2fe", bold = true },
      CmpItemMenu = { fg = "#777d86" },
      -- Spell
      SpellBad = { sp = "#ffbba6", undercurl = true },
      SpellCap = { sp = "#ffbba6", undercurl = true },
      SpellLocal = { sp = "#ffbba6", undercurl = true },
      SpellRare = { sp = "#ffbba6", undercurl = true },
    },
  }
  vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    callback = function()
      vim.cmd("Catppuccin " .. (vim.v.option_new == "light" and "latte" or "mocha"))
    end,
  })

  local mocha = require("catppuccin.palettes").get_palette "mocha"
  lvim.builtin.bufferline.highlights = require("catppuccin.groups.integrations.bufferline").get()

end

return M
