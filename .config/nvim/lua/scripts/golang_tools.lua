local urls = {
  --gopls = 'golang.org/x/tools/gopls',
  gomodifytags = 'github.com/fatih/gomodifytags',
  gotest = 'github.com/cweill/gotests/...',
  impl = 'github.com/josharian/impl',
  dlv = 'github.com/go-delve/delve/cmd/dlv',
  iferr = 'github.com/koron/iferr',
  staticcheck = 'honnef.co/go/tools/cmd/staticcheck'
}

function install(pkg)
  local utils = require('scripts.utils')
  local job = require('plenary.job') -- For Async work
  local url = urls[pkg] .. '@latest'

  job:new({
    command = 'go',
    args = { 'install', url },
    on_exit = function(_, retval)
      if retval ~= 0 then
        utils.notify("command 'go install " .. url .. "' exited with code " .. retval, "error")
        return
      end

      utils.notify("install " .. url .. " finished", "info")
    end,
  })
end

return function() 
  for pkg, _ in pairs(urls) do
    install(pkg)
  end
end
