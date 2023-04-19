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

-----------------------------------
-- Java
-----------------------------------
local jdtls_jar_path = '/home/artlkv/jdt/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local config_path = '/home/artlkv/jdt/jdtls/config_linux'
local lombok_jar_path = '/home/artlkv/jdt/lombok.jar'
local google_java_formatter = '/home/artlkv/jdt/eclipse-java-goodle-style.xml'
-- TODO: Add debugger support

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_path = '/home/artlkv/jdt/workspace/' .. project_name

lspconfig.jdtls.setup({
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. lombok_jar_path,
    '-Xms4G',
    '-Xmx16G',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', jdtls_jar_path,
    '-configuration', config_path,
    '-data', workspace_path,
  },
  root_dir = util.root_pattern('.git', 'mvnw', 'pom.xml', 'gradlew', 'build.gradle'),
  settings = {
    java = {
      home = '/home/artlkv/jdt/jdk/temurin/17.0.6',
      configuration = {
        updateBuildConfiguration = 'interactive',
        runtimes = {
          {
            name = 'JavaSE-17',
            path = '/home/artlkv/jdt/jdk/temurin/17.0.6',
          },
        },
      },
      format = {
        enabled = true,
        settings = {
            url = google_java_formatter_path,
            profile = 'GoogleStyle',
        }
      },
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      importOrder = {
        'java',
        'javax',
        'com',
        'org'
      },
    },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },
  flags = { allow_incremental_sync = true },
  init_options = {},
})
