vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

-- Setting the keymap with keymap.set(arg1, arg2, arg3) function.
-- where,
-- arg1: the mode this keymap applies to, like i for insert mode.
-- arg2: the keys which are going to be used.
-- arg3: what the action will be.

-- in insert mode pressing jk will be equivalent of pressing ESC, i.e. go to normal mode.
keymap.set("i", "jk", "<ESC>")

-- normal mode, when press space, n, h then it clears the search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- normal mode, delete the character but not copy to any register
keymap.set("n", "x", "_x")

-- normal mode increment and decrement using leader key
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files in the project
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find text throughout the project
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find the current string where the cursor is
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- show active buffers
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- show help tags
