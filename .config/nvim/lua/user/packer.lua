-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
-- Packer can manage itself
use 'wbthomason/packer.nvim'

use {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
}

use({
	'folke/tokyonight.nvim',
	as = 'tokyonight',
	config = function()
		vim.cmd('colorscheme tokyonight-night')
	end
})

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('nvim-treesitter/playground')
use('theprimeagen/harpoon') 
use('mbbill/undotree') 
use('tpope/vim-fugitive')
use {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

}

use({'glepnir/dbsession.nvim', cmd = { 'SessionSave', 'SessionDelete', 'SessionLoad'},
config = function() require('dbsession').setup({}) end
})

use('nvim-tree/nvim-web-devicons')

use({
	"iamcco/markdown-preview.nvim",
	run = function() vim.fn["mkdp#util#install"]() end,
})

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

use('barrett-ruth/live-server.nvim')
use 'MunifTanjim/prettier.nvim'
use("nvim-tree/nvim-tree.lua")
use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}
end)
