return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        dependencies = {
            {
                "mason-org/mason.nvim",
                version = "^1.0.0",
                build = ":MasonUpdate",
            },

            {
                "mason-org/mason-lspconfig.nvim",
                version = "^1.0.0",
            },
        },
        config = function()
            require("lsps")
        end,
    },

    {
        "nvim-lua/lsp-status.nvim",
    },
}
