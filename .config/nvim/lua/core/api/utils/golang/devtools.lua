local M = {}

local parser = require('core.api.utils.golang.code_parser')
local extensions = require('core.api.extensions')

--------------------------------------------
-- Golang Tools Variables
M.urls = {
  gopls = 'golang.org/x/tools/gopls',
  gomodifytags = 'github.com/fatih/gomodifytags',
  -- gotests = 'github.com/cweill/gotests/...',
  -- goplay = 'github.com/haya14busa/goplay/cmd/goplay',
  -- impl = 'github.com/josharian/impl',
  -- dlv = 'github.com/go-delve/delve/cmd/dlv',
  -- iferr = 'github.com/koron/iferr',
  -- staticcheck = 'honnef.co/go/tools/cmd/staticcheck'
}
--------------------------------------------
-- Golang Utils
local function modify_tags(operation, type)
  local Job = require('plenary.job')
  local file_path = vim.fn.expand('%')
  local nodes = parser.get_struct_at_cursor_position(unpack(vim.api.nvim_win_get_cursor(0)))
  if nodes == nil then
    return
  end
  local cmd_args = {
    '-format', 'json',
    '-file', file_path,
    '-w'
  }
  if nodes.name == nil then
    local _, csrow, _, _ = unpack(vim.fn.getpos('.'))
    table.insert(cmd_args, '-line')
    table.insert(cmd_args, csrow)
  else
    table.insert(cmd_args, '-struct')
    table.insert(cmd_args, nodes.name)
  end

  if operation == 'add' then
    table.insert(cmd_args, '-add-tags')
    table.insert(cmd_args, type)
  elseif operation == 'remove' then
    table.insert(cmd_args, '-remove-tags')
    table.insert(cmd_args, type)
  end

  local res_data
  Job:new({
    command = 'gomodifytags',
    args = cmd_args,
    on_exit = function(data, retval)
      if retval ~= 0 then
        vim.notify('Command `gomodifytags ' .. unpack(cmd_args) .. '` FAILED with code' .. retval, 'error')
        return
      end
      res_data = data:result()
    end,
  }):sync()

  local tagged = vim.json.decode(table.concat(res_data))
  if tagged.errors ~= nil or tagged.lines == nil or tagged['start'] == nil or tagged['start'] == 0 then
    vim.notify('Failed to set tags ' .. vim.inspect(tagged), 'error')
  end

  for index, value in ipairs(tagged.lines) do
    tagged.lines[index] = extensions.rtrim(value)
  end

  vim.api.nvim_buf_set_lines(0, tagged.start - 1, tagged.start - 1 + #tagged.lines, false, tagged.lines)
  vim.cmd('write')
end
--------------------------------------------
-- Golang Tags support
-- TODO: Rename `type` to ...
function M.add_tags(type)
  modify_tags('add', type)
end

function M.remove_tags(type)
  modify_tags('remove', type)
end
--------------------------------------------
-- Golang Mod support
function M.create_module(name)
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

function M.tidy_module()
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
--------------------------------------------
-- Golang DevTools installation script
function M.install_tools()
  for pkg, _ in pairs(M.urls) do
    local Job = require('plenary.job') -- For Async work
    local url = M.urls[pkg] .. '@latest'
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
--------------------------------------------
return M
