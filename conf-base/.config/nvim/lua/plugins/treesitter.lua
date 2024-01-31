return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "gdscript",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "svelte",
        "glsl",
        "typescript",
        "vim",
        "yaml",
        "css",
        "rust",
        "cpp",
      })
    end,
  },
}
