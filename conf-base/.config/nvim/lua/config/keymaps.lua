-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Recenter on large movement
keymap("n", "<S-h>", "<S-h>zz")
keymap("n", "<S-l>", "<S-l>zz")

keymap("v", "<S-h>", "<S-h>zz")
keymap("v", "<S-l>", "<S-l>zz")

keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Skip storing into buffer
keymap("x", "<leader>p", '"_dp', { desc = "Paste line no copying" })
keymap("v", "<leader>p", '"_dP', { desc = "Paste selection no copying" })

keymap("x", "<leader>d", '"_d', { desc = "Delete no copy" })
keymap("v", "<leader>d", '"_d', { desc = "Delete no copy" })

-- Allow some small movement in insert mode
keymap("i", "<A-h>", "<C-o>h")
keymap("i", "<A-j>", "<C-o>j")
keymap("i", "<A-k>", "<C-o>k")
keymap("i", "<A-l>", "<C-o>l")

-- keymap("n", "<C-H>", "db", opts)
keymap("i", "<C-H>", "<C-W>", opts)

-- Replacement commands
keymap("v", "<leader>r", [[y:let @/ = @"<CR>:%s/<C-r>///gc<left><left><left>]], { desc = "Replace selected text" })

-- keymap("v", "<leader>r", [[y:let @/ = @"<CR>:%sno/<C-r>///gc<left><left><left>]], opts)
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })
keymap(
  "n",
  "<leader>R",
  [[:cdo s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" }
)

keymap("n", "<leader>o", "o<Esc>k", { desc = "Insert line under cursor" })
keymap("n", "<leader>O", "O<Esc>j", { desc = "Insert line above cursor" })

-- Probably better to go to n mode
-- keymap("i", "<C-h>", "<C-o>b")
-- keymap("i", "<C-j>", "<C-o>j")
-- keymap("i", "<C-k>", "<C-o>k")
-- keymap("i", "<C-l>", "<C-o>w")

-- Git commands
keymap("n", "<leader>gg", ":Neogit<CR>", { desc = "Open Neogit" })
keymap("n", "<leader>gG", "<Nop>")
keymap("n", "Q", "<Nop>")
-- keymap("n", "<leader>g-- windows

keymap("n", "<leader>ww", "<Nop>", { remap = true })
keymap("n", "<leader>d", "<C-W>c", { desc = "Delete window", remap = true })
keymap("n", "<leader>w-", "<Nop>", { remap = true })
keymap("n", "<leader>w|", "<Nop>", { remap = true })
keymap("n", "<leader>-", "<C-W>s", { desc = "Split window down", remap = true })
keymap("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = true })
-- keymap("n", "|", "<C-W>v", { desc = "Split window right", remap = true })
-- keymap("n", "\\", "<C-W>s", { desc = "Split window down", remap = true })
-- s", require("fugitive.builtin").resume, { noremap = true, silent = true, desc = "Resume" })
