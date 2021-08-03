local M = {}

M.config = function()
  -- Buffer line setup
  require("bufferline").setup {
    options = {
      indicator_icon = "▎",
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      close_command = "bdelete %d",
      right_mouse_command = "bdelete! %d",
      left_trunc_marker = "",
      right_trunc_marker = "",
      offsets = {
        { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "center", padding = 1 },
        { filetype = "Outline", text = "Symbols Outline", text_align = "center", padding = 1 },
        { filetype = "dashboard", text = "Dashboard", text_align = "center", padding = 1 },
        { filetype = "packer", text = "Packer", text_align = "center", padding = 1 },
      },
      show_tab_indicators = true,
      show_close_icon = false,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        if context.buffer:current() then
          return ""
        end

        local icon = level:match "error" and " " or " "
        return " " .. icon .. count
      end,
    },
    highlights = {
      fill = {
        guifg = { attribute = "fg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "StatusLineNC" },
      },
      -- background = {
      --     guifg = {attribute = "fg", highlight = "Normal"},
      --     guibg = {attribute = "bg", highlight = "StatusLine"}
      -- },
      -- buffer_visible = {
      --     gui = "",
      --     guifg = {attribute = "fg", highlight = "Normal"},
      --     guibg = {attribute = "bg", highlight = "Normal"}
      -- },
      -- buffer_selected = {
      --     gui = "",
      --     guifg = {attribute = "fg", highlight = "Normal"},
      --     guibg = {attribute = "bg", highlight = "Normal"}
      -- },
      -- separator = {
      --     guifg = {attribute = "bg", highlight = "Normal"},
      --     guibg = {attribute = "bg", highlight = "StatusLine"}
      -- },
      -- separator_selected = {
      --     guifg = {attribute = "fg", highlight = "Special"},
      --     guibg = {attribute = "bg", highlight = "Normal"}
      -- },
      -- separator_visible = {
      --     guifg = {attribute = "fg", highlight = "Normal"},
      --     guibg = {attribute = "bg", highlight = "StatusLineNC"}
      -- },
      -- close_button = {
      --     guifg = {attribute = "fg", highlight = "Normal"},
      --     guibg = {attribute = "bg", highlight = "StatusLine"}
      -- },
      -- close_button_selected = {
      --     guifg = {attribute = "fg", highlight = "normal"},
      --     guibg = {attribute = "bg", highlight = "normal"}
      -- },
      -- close_button_visible = {
      --     guifg = {attribute = "fg", highlight = "normal"},
      --     guibg = {attribute = "bg", highlight = "normal"}
      -- }
    },
  }

  local opt = { silent = true }

  --command that adds new buffer and moves to it
  -- vim.api.nvim_command "com -nargs=? -complete=file_in_path New badd <args> | blast"
  -- vim.api.nvim_set_keymap("n", "<S-b>", ":New ", opt)

  --removing a buffer
  vim.api.nvim_set_keymap("n", "<S-x>", [[:bdelete!<CR>]], opt)

  -- tabnext and tabprev
  vim.api.nvim_set_keymap("n", "<TAB>", [[:BufferLineCycleNext<CR>]], opt)
  vim.api.nvim_set_keymap("n", "<S-TAB>", [[:BufferLineCyclePrev<CR>]], opt)
end

lvim.builtin.which_key.mappings["b"] = {
  name = "Buffers",
  j = { ":BufferLinePick<CR>", "jump to buffer" },
  f = { ":Telescope buffers<CR>", "Find buffer" },
  h = { ":BufferLineMovePrev<CR>", "move buffer left" },
  l = { ":BufferLineMoveNext<CR>", "move buffer right" },
  H = { ":BufferLineCloseLeft<CR>", "close all buffers to the left" },
  L = { ":BufferLineCloseRight<CR>", "close all buffers to the right" },
  D = { ":BufferLineSortByDirectory<CR>", "sort by directory" },
  E = { ":BufferLineSortByExtension<CR>", "sort by extension" },
  R = { ":BufferLineSortByRelativeDirectory<CR>", "sort by relative directory" },
}
return M
