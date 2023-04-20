vim.api.nvim_create_user_command('GoInstallDeps', function() 
  local GT = require('core.api.utils.go_devtools')
  GT.install_deps()
end, {})
