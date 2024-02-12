local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Import necessary modules
local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  pickers = {
    find_files = {
      hidden = true, 
    },
  },
})
