lvim.plugins = require("plugins.init") --load plugins
require("mappings.init") --load mappings

vim.opt.wrap = true  -- Enable line wrapping
vim.opt.linebreak = true  -- Avoid breaking words in the middle

-- Configure Catppuccin
require("catppuccin").setup({
  flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
  transparent_background = true, -- Transparent background
  custom_highlights = function(colors)
    return {
      Normal = { bg = "NONE" }, -- Background will use terminal transparency
      NormalFloat = { bg = "NONE" }, -- Floating windows transparent
      CursorLine = { bg = colors.mantle }, -- Highlighted line
      Visual = { bg = colors.blue }, -- Visual selection
      LineNr = { fg = colors.overlay1, bg = "NONE" }, -- Line numbers
      CursorLineNr = { fg = colors.yellow, bg = "NONE" }, -- Current line number
    }
  end,
  integrations = {
    treesitter = true,
    nvimtree = true,
    telescope = true,
    which_key = true,
    gitsigns = true,
    lsp_saga = true,
    cmp = true,
    markdown = true,
    native_lsp = { enabled = true },
  },
})

-- Set colorscheme
lvim.colorscheme = "catppuccin"

-- NvimTree configuration
lvim.builtin.nvimtree.setup = {
  hijack_netrw = true,
  open_on_setup = false,
  auto_close = true,
  filters = {
    dotfiles = false, -- Show dotfiles in NvimTree
  },
}
