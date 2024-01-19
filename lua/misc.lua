-- show line numbers
vim.o.number = true
vim.wo.number = true

-- the correct way to split
vim.o.splitright = true
vim.o.splitbelow = true

-- start scrolling once you reach last
-- 3 visible lines of buffer
vim.o.scrolloff = 3
vim.wo.scrolloff = 3

-- backspace (delete) over indent, etc.
vim.o.backspace = "indent,eol,start"

-- searching
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- visualize tabs and newlines
vim.o.listchars = "tab:· ,trail:▸,nbsp:⎵"
vim.wo.listchars = "tab:· ,trail:▸,nbsp:⎵"
vim.o.list = true
vim.wo.list = true

-- backup options
vim.o.backup = true
vim.o.undofile = true
vim.bo.undofile = true

-- save temporary and backup files to neovim's data dir
-- instead of the file's current dir
vim.o.backupdir = DATA_PATH .. "/backup"
vim.o.directory = DATA_PATH .. "/directory"
vim.o.undodir = DATA_PATH .. "/undo"

-- indent
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
-- vim.o.shiftround = false
vim.o.autoindent = true
vim.cmd("filetype plugin indent on")

-- colors
vim.o.termguicolors = true

-- folds
vim.o.foldnestmax = 5
vim.wo.foldnestmax = 5
-- treesitter folds
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- no folds closed by default
vim.o.foldlevelstart = 99

-- My changes
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Fancy comments
vim.keymap.set({"n", "v"}, "<leader>#", "I#<Space><Esc>A<Space>#<Esc>yy2P<C-V>$r#2j.")
