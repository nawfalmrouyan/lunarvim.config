local M = {}

M.config = function()
  local status_ok, onedark = pcall(require, "onedark")
  if not status_ok then
    return
  end
  onedark.setup {
    style = "darker",
    transparent = true, -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
      comments = "italic",
      keywords = "bold",
      functions = "bold",
      strings = "none",
      variables = "bold",
    },

    -- Lualine options --
    lualine = {
      transparent = true, -- lualine center bar transparency
    },

    -- Plugins Config --
    diagnostics = {
      darker = true, -- darker colors for diagnostic
      undercurl = true, -- use undercurl instead of underline for diagnostics
      background = true, -- use background color for virtual text
    },
    highlights = {
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
end

return M
