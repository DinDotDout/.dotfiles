return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "rust-analyzer",
        -- "shfmt",
        -- "flake8",
        "gdtoolkit",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gdscript = {},
        glslls = {},
        glsl_analyzer = {},
        lua_ls = {},
        clangd = {
          -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
          cmd = {
            "clangd",
            "--offset-encoding=utf-16",
          },
        },
      },
    },
  },
}
