return {
  {
    "catppuccin/nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require("catppuccin").setup({ flavour = "macchiato" })
      vim.cmd([[colorscheme catppuccin]])
    end,
    -- opts = {
    --   config = function()
    --     require("catppuccin").setup({
    --       flavour = "mocha", -- Set the color palette to "mocha"
    --       -- Other configuration options...
    --     })
    --     vim.cmd("colorscheme catppuccin")
    --   end,
    -- },
  },
}
