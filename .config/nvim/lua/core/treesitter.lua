function treesitter_disable(lang, bufnr)
    return vim.api.nvim_buf_line_count(bufnr) > 10000    
end

require'nvim-treesitter.configs'.setup {
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = 'all',

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    disable = function(lang, bufnr) -- Yap, Java files can be very big, and i mear VERY VERY big. > 100.000 lines
        return treesitter_disable(lang, bufnr)
    end,
    additional_vim_regex_highlighting = false,
  },
}
