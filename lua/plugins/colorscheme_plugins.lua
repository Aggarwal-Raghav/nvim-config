---@type LazySpec
return {
    {
        "EdenEast/nightfox.nvim",
        init = function()
            vim.opt.background = "dark"
            vim.cmd("colorscheme terafox")
        end,
    },
}
