local GT = require('scripts.golang_tools')
vim.api.nvim_create_user_command('GoInstallDeps', GT, { nargs = 0 })
