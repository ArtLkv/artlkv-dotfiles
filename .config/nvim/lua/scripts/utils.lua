return {
  notify = function(msg, lvl)
    local l
    if lvl == 'error' or lvl == 4 then
      l = vim.log.levels.ERROR
    elseif lvl == 'info' or lvl == 2 then
      l = vim.log.levels.INFO
    elseif lvl == 'debug' or lvl == 1 then
      l = vim.log.levels.DEBUG
    end

    vim.defer_fn(function()
      vim.notify(msg, l)
    end, 0)
  end,
}
