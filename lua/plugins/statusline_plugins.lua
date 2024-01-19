return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "echasnovski/mini.icons" },
        lazy = false,
    },
    {
        "linrongbin16/lsp-progress.nvim",
        dependencies = { "echasnovski/mini.icons" },
        event = "BufEnter",
    },
}
