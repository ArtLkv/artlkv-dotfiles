require('nvim-autopairs').setup({})
require('toggleterm').setup({
  open_mapping = [[<C-\>]],
  start_in_insert = true,
  shell = "fish.exe",
  direction = "float",
  float_opts = {
    border = "curved",
    width = math.ceil(vim.o.columns*0.8),
    height = math.ceil(vim.o.columns*0.2)
  },
})

