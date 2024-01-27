function ColorMyPencils(color)
  color = color or "tokyonight-night"
  local transparent = false

  vim.cmd.colorscheme(color)

  if (transparent) then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- 0 means global
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- 0 means global
  end
end

ColorMyPencils()
