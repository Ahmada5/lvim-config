lvim.plugins = require("plugins.init") --load plugins
require("mappings.init") --load mappings

vim.opt.wrap = true  -- Enable line wrapping
vim.opt.linebreak = true  -- Avoid breaking words in the middle

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

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

local lspconfig = require("lspconfig")

lspconfig.omnisharp.setup({
  cmd = { "/usr/local/bin/omnisharp/OmniSharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
  capabilities = require("lvim.lsp").common_capabilities(), -- Ensure this function exists
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr) -- Ensure this function exists
    -- Additional custom on_attach logic (if needed)
  end,
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

-- Key mappings for Telescope
lvim.builtin.which_key.mappings["f"] = {
  name = "Find", -- Optional group name in the which-key popup
  f = { "<cmd>Telescope find_files<CR>", "Find File" },
  g = { "<cmd>Telescope live_grep<CR>", "Grep Text" },
  b = { "<cmd>Telescope buffers<CR>", "Buffers" },
  h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
}

