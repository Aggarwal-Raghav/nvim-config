return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>w",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = { "n", "v" },
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                c = { "astyle" },
                cpp = { "astyle" },
                java = { "astyle" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                sql = { "sqlfluff" },
                nix = { "alejandra" },
            },
            formatters = {
                astyle = {
                    prepend_args = { "-p", "-U", "-O", "-f", "-y", "-Y", "-xj", "-xV", "-xp", "-xb", "-Z", "-xg", "-xe", "-W1", "-S", "-K", "-N", "-k1", "-C", "--style=google" },
                },
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                python = { "flake8" },
                sql = { "sqlfluff" },
                nix = { "statix" },
            }
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },
}
