local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

local map = vim.keymap.set

vim.diagnostic.config({ signs = false })

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<leader>f', function() 
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

lspconfig.pyright.setup({
  on_attach = on_attach,
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  settings = {
    pyright = {
      autoImportCompletion = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = true,
        typeCheckingMode = 'off',
      },
    },
  },
  single_file_support = true,
})


lspconfig.cmake.setup({
  cmd = { 'cmake-language-server' },
  filetypes = { 'cmake' },
  root_dir = util.root_pattern('CMakePresets.json', 'CTestConfig.cmake', '.git', 'build', 'cmake'),
  single_file_support = true,
  init_options = {
    buildDirectory = 'build',
  },
})

lspconfig.clangd.setup({
  on_attach = on_attach,
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'cuda', 'obj', 'objcpp', 'proto' },
  root_dir = util.root_pattern('.clangd', '.clang-tidy', '.clang-format',
    'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git'),
  single_file_support = true,
})


