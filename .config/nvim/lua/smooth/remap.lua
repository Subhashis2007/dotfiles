vim.keymap.set("n", "<leader>nt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>nc", vim.cmd.NvimTreeCollapse)
vim.keymap.set("n", "<leader>ct", vim.cmd.ColorizerToggle)
vim.api.nvim_exec([[
set clipboard+=unnamedplus
]], false)

vim.keymap.set("n", "<S-Left>", "<C-w>h")
vim.keymap.set("n", "<S-Down>", "<C-w>j")
vim.keymap.set("n", "<S-Up>", "<C-w>k")
vim.keymap.set("n", "<S-Right>", "<C-w>l")
vim.keymap.set("n", "<leader>fc", ":tabnew $HOME/.config/nvim/<cr>")


-- Buffer Management
vim.api.nvim_set_keymap('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bk', ':bdelete<CR>', { noremap = true, silent = true })


