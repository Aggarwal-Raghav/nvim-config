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
vim.o.backspace = 'indent,eol,start'

-- searching
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- visualize tabs and newlines
vim.o.listchars = 'tab:▸ ,trail:·,nbsp:⎵'
vim.wo.listchars = 'tab:▸ ,trail:·,nbsp:⎵'
vim.o.list = true
vim.wo.list = true

-- backup options
vim.o.backup = true
vim.o.undofile = true
vim.bo.undofile = true

-- save temporary and backup files to neovim's data dir
-- instead of the file's current dir
vim.o.backupdir = DATA_PATH .. '/backup'
vim.o.directory = DATA_PATH .. '/directory'
vim.o.undodir = DATA_PATH .. '/undo'

-- spaces instead of tabs
-- (see vimscript/legacy.vim for filetype specific config)
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

vim.o.softtabstop = 4
vim.bo.softtabstop = 4

vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.shiftround = false

-- colors
vim.o.termguicolors = true
vim.o.background = 'dark'
-- vim.cmd('colorscheme dogrun')
vim.cmd('colorscheme apprentice')
-- vim.api.nvim_set_var('oceanic_material_allow_italic', true)
-- vim.api.nvim_set_var('oceanic_material_allow_bold', true)
-- TODO: set italics (https://github.com/tyrannicaltoucan/vim-deep-space)

-- folds
vim.o.foldnestmax = 5
vim.wo.foldnestmax = 5

-- nvim-tree settings
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_quit_on_open = 1
-- vim.g.nvim_tree_git_hl = 0
-- vim.g.nvim_tree_gitignore = 0
-- vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', 'env' }
-- vim.g.nvim_tree_group_empty = 1
-- vim.g.nvim_tree_show_icons['git'] = 0
-- vim.g.nvim_tree_show_icons = {
--     git = 0,
--     folders = 1,
--     files = 1,
--  }
