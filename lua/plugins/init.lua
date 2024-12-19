-- ~/.config/lvim/lua/plugins/init.lua
return {
  -- Add your plugins here
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Telescope FZF
  { "github/copilot.vim" }, -- GitHub Copilot

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000 -- Ensure it loads first
  },

   {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*", -- Enable for all file types
      }, {
        mode = "background", -- Set display mode to background or virtual text
        names = true,        -- Enable parsing color names like "red", "blue", etc.
      })
    end,
  },


  	-- NvimTree plugin
	{
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Replace "requires" with "dependencies"
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          highlight_opened_files = "all",
        },
        filters = {
          dotfiles = true,
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local opts = { buffer = bufnr, noremap = true, silent = true }

          -- Key mappings for NvimTree
          vim.keymap.set("n", "l", api.node.open.edit, opts)
          vim.keymap.set("n", "<CR>", api.node.open.edit, opts)
          vim.keymap.set("n", "o", api.node.open.edit, opts)
          vim.keymap.set("n", "h", api.node.navigate.parent_close, opts)
          vim.keymap.set("n", "v", api.node.open.vertical, opts)
        end,
      })
    end,
  },

  --telescope setting
  { "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
    config = function()
      -- Load the Telescope extensions for fzf
      require('telescope').setup{
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },  -- Ignore certain directories
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- Enable fuzzy matching
            override_generic_sorter = true, -- Use fzf as sorter
            override_file_sorter = true,    -- Use fzf as file sorter
          },
        },
      }
      -- Load the fzf extension
      require('telescope').load_extension('fzf')
    end,
  },
}

