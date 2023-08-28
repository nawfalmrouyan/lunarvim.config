local M = {}

M.config = function()
  vim.g.firenvim_config = {
    globalSettings = { alt = "all" },
    localSettings = {
      [".*"] = {
        cmdline = "neovim",
        content = "text",
        priority = 0,
        selector = "textarea",
        takeover = "never",
      },
      ["'https?://[^/]+.co.uk/'"] = {
        priority = 1,
        takeover = "never",
      },
      ["https?://camsyscrm.mmu.edu.my/"] = {
        priority = 1,
        takeover = "never",
      },
    },
  }
  vim.api.nvim_create_autocmd({ "UIEnter" }, {
    callback = function(event)
      local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
      if client ~= nil and client.name == "Firenvim" then
        if vim.o.lines < 4 then
          vim.o.lines = 4
        end
        if vim.o.columns < 80 then
          vim.o.columns = 80
        end
      end
    end,
  })
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "github.com_*.txt",
    cmd = "set filetype=markdown",
  })
  -- vim.api.nvim_create_autocmd({ "UIEnter" }, {
  --   callback = function(event)
  --     local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
  --     if client ~= nil and client.name == "Firenvim" then
  --       vim.o.laststatus = 0
  --     end
  --   end,
  -- })
end
return M
