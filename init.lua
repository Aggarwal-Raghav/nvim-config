-- stuff that must be at the very beginning

-- inspired by Primeagen, let's see how it goes
vim.g.mapleader = " "

-- helpful function for debugging:
-- from: https://github.com/nanotee/nvim-lua-guide#tips-2
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

-- to evaluate vim in lua
-- vim.api.nvim_eval('1 + 1')

-- to execute command in lua
-- vim.api.nvim_command('set nonumber') or vim.cmd()

-- getting/setting vim options - https://github.com/nanotee/nvim-lua-guide#using-api-functions
-- alternative: https://github.com/nanotee/nvim-lua-guide#using-meta-accessors

-- getting/setting vim global vars - vim.api.nvim_set_var()
-- https://github.com/nanotee/nvim-lua-guide#using-api-functions-1
-- alternative: https://github.com/nanotee/nvim-lua-guide#using-meta-accessors-1

-- keymaps - https://github.com/nanotee/nvim-lua-guide#defining-mappings

-- helper function to automatically escape term keycodes
-- ref: https://github.com/nanotee/nvim-lua-guide#vimapinvim_replace_termcodes
-- The function is called `t` for `termcodes`.
-- You don't have to call it that, but I find the terseness convenient
function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

DATA_PATH = vim.fn.stdpath('data')

-- this sets a global var that is needed before COQ_nvim loads
require('coq_conf')
require("plugins")
require("misc")
require("lsps")
require("statusline")
require('keybinds')
require('telescope_conf')
require('treesitter_conf')
require('gitsigns_conf')
require('nvim_tree_conf')
require('neovide_conf')
require('vimwiki_conf')
vim.cmd('source ' .. vim.fn.stdpath("config") .. '/vimscript/legacy.vim')

print("hello from sam")

