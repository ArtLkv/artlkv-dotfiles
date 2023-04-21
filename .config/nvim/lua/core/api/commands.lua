vim.api.nvim_create_user_command('GoInstallDeps', function()
  require('core.api.utils.go_devtools').install_tools()
end, {})

vim.api.nvim_create_user_command('GoModInit', function(opts)
  require('core.api.utils.go_devtools').create_module(opts.fargs[1])
end, { nargs = 1 })

vim.api.nvim_create_user_command('GoModTidy', function()
  require('core.api.utils.go_devtools').tidy_module()
end, {})
