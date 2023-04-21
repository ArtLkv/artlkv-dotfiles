local GT = {}

GT.urls = {
  gopls = 'golang.org/x/tools/gopls',
  gomodifytags = 'github.com/fatih/gomodifytags',
  gotests = 'github.com/cweill/gotests/...',
  goplay = 'github.com/haya14busa/goplay/cmd/goplay',
  impl = 'github.com/josharian/impl',
  dlv = 'github.com/go-delve/delve/cmd/dlv',
  iferr = 'github.com/koron/iferr',
  staticcheck = 'honnef.co/go/tools/cmd/staticcheck'
}

function GT.create_module(name)
  local Job = require('plenary.job')
  Job:new({
    command = 'go',
    args = { 'mod', 'init', name },
    on_exit = function(_, retval)
      if retval ~= 0 then
        vim.notify('Initializing go module `' .. name .. '` FAILED with code' .. retval, 'error')
        return
      end
      vim.notify('Initializing go module `' .. name .. '` SUCCEDED', 'info')
    end,
  }):start()
end

function GT.tidy_module()
  local Job = require('plenary.job')
  Job:new({
    command = 'go',
    args = { 'mod', 'tidy' },
    on_exit = function(_, retval)
      if retval ~= 0 then
        vim.notify('Tidy go module FAILED with code' .. retval, 'error')
        return
      end
      vim.notify('Tidy go module SUCCEDED', 'info')
    end,
  }):start()
end

function GT.install_tools()
  for pkg, _ in pairs(GT.urls) do
    local Job = require('plenary.job') -- For Async work
    local url = GT.urls[pkg] .. '@latest'
    Job:new({
      command = 'go',
      args = { 'install', url },
      on_exit = function(_, retval)
        if retval ~= 0 then
          vim.notify('Installing ' .. url .. ' FAILED with code ' .. retval, 'error')
          return
        end
        vim.notify('Installing ' .. url .. ' SUCCEDED', 'info')
      end,
    }):start()
  end
end

return GT
