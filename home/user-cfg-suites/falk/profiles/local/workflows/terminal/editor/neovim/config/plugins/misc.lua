-- TODO: Redundant? Or change nix-file to use this?

-- Lualine
require("lualine").setup({
   icons_enabled = true,
   theme         = 'onedark',
})

-- Colorscheme
vim.cmd("colorscheme gruvbox") -- TODO: Make use of Stylix?

-- Comment
require("Comment").setup()
