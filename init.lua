-- vim ui2
require("vim._core.ui2").enable {
    enable = true,
    msg = {
        target = "msg", -- options: cmd(classic), msg(similar to noice)
        pager = { height = 1 },
        msg = { height = 0.5, timeout = 4500 },
        dialog = { height = 0.5 },
        cmd = { height = 0.5 },
    },
}

-- stuff that must be at the very beginning

-- inspired by Primeagen, let's see how it goes
vim.g.mapleader = " "

DATA_PATH = vim.fn.stdpath("data")

require("lazy_conf")
require("misc")
require("keybinds")
require("neovide_conf")
require("statusline_conf")
vim.cmd("source " .. vim.fn.stdpath("config") .. "/vimscript/legacy.vim")
