vim.g.mapleader= " "
vim.keymap.set("n", "<leader>nt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>nc", vim.cmd.NvimTreeCollapse)
vim.api.nvim_exec([[
set clipboard+=unnamedplus
]], false)
