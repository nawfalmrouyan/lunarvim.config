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
      conditionals = { "italic" },
      loops = {},
      functions = { "bold" },
      keywords = { "bold" },
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      treesitter = true,
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
      coc_nvim = false,
      lsp_trouble = true,
      cmp = true,
      lsp_saga = true,
      gitgutter = false,
      gitsigns = true,
      leap = true,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = true,
        transparent_panel = false,
      },
      neotree = {
        enabled = false,
        show_root = true,
        transparent_panel = false,
      },
      dap = {
        enabled = false,
        enable_ui = false,
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      markdown = true,
      lightspeed = true,
      ts_rainbow = true,
      hop = false,
      notify = true,
      telekasten = false,
      symbols_outline = true,
      mini = false,
      aerial = false,
      vimwiki = false,
      beacon = false,
      navic = false,
      overseer = false,
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
  vim.api.nvim_create_autocmd("User", {
    pattern = "PackerCompileDone",
    callback = function()
      vim.cmd "CatppuccinCompile"
      vim.defer_fn(function()
        vim.cmd "colorscheme catppuccin"
      end, 0) -- Defered for live reloading
    end,
  })
  vim.cmd [[colorscheme catppuccin]]
end

return M
