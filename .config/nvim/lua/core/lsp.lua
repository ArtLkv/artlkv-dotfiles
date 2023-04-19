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

lspconfig.gopls.setup({
  on_attach = on_attach,
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_dir = util.root_pattern('go.mod', '.git'),
  single_file_support = true,
})

lspconfig.omnisharp.setup({
  on_attach = on_attach,
  cmd = { 'dotnet', '/home/artlkv/omnisharp/OmniSharp.dll' },
  root_dir = util.root_pattern('.csproj', '.sln', '.git'),
  sdk_include_prereleases = true,
  enable_import_completion = true,
  enable_editorconfig_support = true,
  organize_import_on_format = false,
  enable_roslyn_analyzers = false,
  analyze_open_documents_only = false,
  enable_ms_build_load_projects_on_demand = false, -- Set True if very big codebase
})
