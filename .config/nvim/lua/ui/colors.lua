function ColorMyPencils(color)
  -- color = color or "gruvbox"
  -- color = color or "tokyonight-night"
  color = color or "vscode"
  vim.cmd.colorscheme(color)

  -- Disable background
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
