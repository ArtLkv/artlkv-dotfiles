GT = {}

GT.urls = {
  gopls = 'golang.org/x/tools/gopls',
  gomodifytags = 'github.com/fatih/gomodifytags',
  gotest = 'github.com/cweill/gotests/...',
  impl = 'github.com/josharian/impl',
  dlv = 'github.com/go-delve/delve/cmd/dlv',
  iferr = 'github.com/koron/iferr',
  staticcheck = 'honnef.co/go/tools/cmd/staticcheck'
}

function GT.install(pkg)
  -- local utils = require('scripts.utils')
  local Job = require('plenary.job') -- For Async work
  local url = GT.urls[pkg] .. '@latest'
  Job:new({
    command = 'go',
    args = { 'install', url },
    on_exit = function(_, retval)
      if retval ~= 0 then
        vim.notify("command 'go install " .. url .. "' exited with code " .. retval, "error")
        return
      end
      vim.notify("install " .. url .. " finished", "info")
    end,
  }):start()
end

function GT.install_deps() 
  for pkg, _ in pairs(GT.urls) do
    GT.install(pkg)
  end
  vim.notify("Happy Coding :)", "info")
end

return GT
