vim.cmd [[packadd packer.nvim]]

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_boostrap = vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function(use)
  -- Package Manager
  use { 'wbthomason/packer.nvim' }
  -- Colorscheme
  use { 'Mofiqul/vscode.nvim' }
  -- File Parser
  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
  -- use { 'nvim-treesitter/playground' }
  -- Telescope, Fzf
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }
  -- Git support
  -- Miscellaneous
  use { 'nvim-lua/plenary.nvim' }
  use { 'windwp/nvim-autopairs' }
  -- UI
  use { 'nvim-tree/nvim-web-devicons' }
  use { 'nvim-tree/nvim-tree.lua' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'akinsho/bufferline.nvim', tag = "v3.*" }
  use { 'onsails/lspkind.nvim' }
  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'ray-x/lsp_signature.nvim' }
  -- Debugger
  -- Autocomplete - hrsh7th pack
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-emoji' } 
  -- Snippets
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }
  -- Tools for DevOps and Golang

  if packer_boostrap then
    require('packer').sync()
  end
end)
