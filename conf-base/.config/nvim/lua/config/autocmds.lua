-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- autocmd FileType lisp setl cms=;%s
-- local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
--   clear = true,
-- })

local autocmd = vim.api.nvim_create_autocmd
-- Comments for shaders

-- Set vert and frag to be detected as glsl files by treesitter and lsp
-- autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.frag" },
--   command = "set filetype=frag",
-- })
-- autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.vert" },
--   command = "set filetype=vert",
-- })

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.vert", "*.frag", "*.ply", "*.lst", "*.obj", "*.gltf", "*.glb" },
  command = "set filetype=glsl",
  -- command = "LspStart glslls",
})
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.glsl", "*.vert", "*.frag" },
  command = "setlocal commentstring=//%s",
})

-- autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.glsl", "*.vert", "*.frag", "*.ply", "*.lst", "*.obj", "*.gltf", "*.glb" },
--   command = "TSBufEnable highlight",
-- })
