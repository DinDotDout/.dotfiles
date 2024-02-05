return {
  {
    "catppuccin/nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    name = "catppuccin",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd.colorscheme("catppuccin")
      local mocha = require("catppuccin.palettes").get_palette("mocha")

      -- print(vim.inspect(mocha))
      -- vim.cmd("highlight FlashMatch guifg=" .. mocha.text .. " guibg=" .. mocha.overlay0)
      -- vim.cmd("highlight FlashLabel guifg=" .. mocha.yellow .. " guibg=" .. mocha.base)
      -- vim.cmd("highlight FlashBackdrop guifg=" .. mocha.text .. " guibg=" .. mocha.base) -- bg text
    end,
  },
}
