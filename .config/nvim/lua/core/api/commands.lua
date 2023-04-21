--------------------------------------------
-- Golang commands
vim.api.nvim_create_user_command('GoInstallDeps', function()
  require('core.api.utils.golang.devtools').install_tools()
end, {})

vim.api.nvim_create_user_command('GoModInit', function(opts)
  require('core.api.utils.golang.devtools').create_module(opts.fargs[1])
end, { nargs = 1 })

vim.api.nvim_create_user_command('GoModTidy', function()
  require('core.api.utils.golang.devtools').tidy_module()
end, {})

vim.api.nvim_create_user_command('GoAddTags', function(opts)
  require('core.api.utils.golang.devtools').add_tags(opts.fargs[1])
end, { nargs = 1})

vim.api.nvim_create_user_command('GoRemoveTags', function(opts)
  require('core.api.utils.golang.devtools').remove_tags(opts.fargs[1])
end, { nargs = 1 })
--------------------------------------------
