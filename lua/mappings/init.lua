-- ~/.config/lvim/lua/mappings/init.lua
local map = vim.keymap.set

-- General key mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true }) -- Find files
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true }) -- Live grep
map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true }) -- Toggle file tree
map("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { noremap = true, silent = true })  -- Search in current buffer

-- Buffer navigation
map("n", "<S-L>", ":bnext<CR>", { noremap = true, silent = true }) -- Next buffer
map("n", "<S-H>", ":bprevious<CR>", { noremap = true, silent = true }) -- Previous buffer
map("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true }) --close buffer
-- Close only the current buffer and switch to the next buffer
map("n", "<S-q>", ":bp<bar>sp<bar>bn<bar>bd<CR>", { noremap = true, silent = true })

