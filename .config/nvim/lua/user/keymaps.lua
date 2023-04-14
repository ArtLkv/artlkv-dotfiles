----------------------------
-- Main Mappings
----------------------------
local map = vim.keymap.set
vim.g.mapleader = ' '
function save_file()
  vim.cmd[[update]]
end
map('n', '<leader>t', vim.cmd.ToggleTerm)
map('n', '<leader>sf', save_file)
----------------------------
-- Disable arrows. Only hjkl
----------------------------
map('', '<up>', '', opts)
map('', '<down>', '', opts)
map('', '<left>', '', opts)
map('', '<right>', '', opts)
----------------------------
-- Git Mappings
----------------------------
map('n', '<leader>gs', vim.cmd.Git)
map('n', '<leader>u', vim.cmd.UndotreeToggle)
---------------------------
-- Telescope Mappings
-----------------------------
local builtin = require('telescope.builtin')
map('n', '<leader>fv', vim.cmd.NvimTreeToggle)
map('n', '<leader>ff', builtin.find_files)
map('n', '<leader>fb', builtin.buffers)
map('n', '<leader>fg', function() 
  builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)
-----------------------------
-- Bufferline Mappings
-----------------------------
function delete_buffer()
  vim.cmd([[update]])
  vim.cmd([[bdelete!]])
end
map('n', '<leader>bq', delete_buffer)
map('n', '<leader>bp', vim.cmd.BufferLineTogglePin)
map('n', '<leader>bs', vim.cmd.BufferLinePick)
map('n', '<C-h>', vim.cmd.BufferLineCyclePrev)
map('n', '<C-l>', vim.cmd.BufferLineCycleNext)
-----------------------------
-- Diagnostic Mappings
-----------------------------
map('n', '<leader>e', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<leader>q', vim.diagnostic.setloclist)
-----------------------------
-- Autocomplete Mappings
-----------------------------
-- File: ~/.config/nvim/lua/core/cmp.lua
-- Object: cmp.mapping
-----------------------------

-----------------------------
-- LSP Mappings
-----------------------------
-- File: ~/.config/nvim/lua/core/lsp.lua
-- Object: on_attach function
-----------------------------
