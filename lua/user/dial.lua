local M = {}

M.config = function()

  local status_ok, augend = pcall(require, "dial.augend")
  if not status_ok then
    return
  end

  require("dial.config").augends:register_group {
    default = {
      augend.integer.alias.decimal,
      augend.integer.alias.decimal_int,
      augend.integer.alias.hex,
      augend.integer.alias.binary,
      augend.integer.alias.octal,
      augend.date.alias["%Y/%m/%d"],
      augend.constant.alias.bool,
      augend.constant.alias.alpha,
      augend.constant.alias.Alpha,
      augend.hexcolor.new{
        case = "lower",
      },
      augend.semver.alias.semver,
    },
    visual = {
      augend.integer.alias.decimal,
      augend.integer.alias.hex,
      augend.date.alias["%Y/%m/%d"],
      augend.constant.alias.alpha,
      augend.constant.alias.Alpha,
    },
  }

  -- change augends in VISUAL mode
  vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_normal "visual", { noremap = true })
  vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_normal "visual", { noremap = true })

  vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
  vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
  vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
  vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
  vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
  vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })

end

return M
