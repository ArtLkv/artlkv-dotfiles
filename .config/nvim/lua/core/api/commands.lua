vim.api.nvim_create_user_command('GoInstallDeps', function() 
  local GT = require('core.api.tools.go_devtools')
  GT.install_deps()
end, {})

--command! GoInstallDeps :lua require"gopher.api".install_deps()
