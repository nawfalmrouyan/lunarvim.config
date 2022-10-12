local M = {}

M.config = function()
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    return
  end
  vim.g.catppuccin_flavour = "mocha"
  catppuccin.setup {
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    transparent_background = false,
    term_colors = true,
    compile = {
      enabled = true,
      path = vim.fn.stdpath "cache" .. "/catppuccin",
    },
    styles = {
      comments = { "italic" },
      conditionals = {},
      loops = { "italic" },
      functions = { "italic", "bold" },
      keywords = { "italic", "bold" },
      strings = { "italic" },
      variables = {},
      numbers = {},
      booleans = { "italic" },
      properties = { "italic" },
      types = { "italic" },
      operators = {},
    },
    require("catppuccin").setup {
      integrations = {
        aerial = false,
        barbar = true,
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
        lsp_saga = true,
        lsp_trouble = false,
        markdown = true,
        mini = false,
        neogit = false,
        neotest = false,
        neotree = false,
        notify = true,
        nvimtree = true,
        overseer = false,
        pounce = false,
        symbols_outline = false,
        telekasten = true,
        telescope = true,
        treesitter = true,
        treesitter_context = false,
        ts_rainbow = true,
        vim_sneak = false,
        vimwiki = false,
        which_key = true,

        -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
        dap = {
          enabled = false,
          enable_ui = false,
        },
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
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
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        navic = {
          enabled = true,
          custom_bg = "NONE",
        },
      },
    },
    color_overrides = {},
    highlight_overrides = {},
  }
  vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    callback = function()
      vim.cmd("Catppuccin " .. (vim.v.option_new == "light" and "latte" or "mocha"))
    end,
  })
  -- Create an autocmd User PackerCompileDone to update it every time packer is compiled
  -- vim.api.nvim_create_autocmd("User", {
  --   pattern = "PackerCompileDone",
  --   callback = function()
  --     vim.cmd "CatppuccinCompile"
  --     vim.defer_fn(function()
  --       vim.cmd "colorscheme catppuccin"
  --     end, 0) -- Defered for live reloading
  --   end,
  -- })
  vim.cmd [[colorscheme catppuccin]]
end

return M
