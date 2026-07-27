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
                python = { "ruff_organize_imports", "ruff_format" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                java = { "google-java-format" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                sql = { "sql_formatter" },
                nix = { "alejandra" },
                sh = { "shfmt" },
                bash = { "shfmt" },
                zsh = { "shfmt" },
                xml = { "xmlformat", "add_xml_spaces" },
            },
            formatters = {
                add_xml_spaces = {
                    command = "perl",
                    args = { "-pe", "s#</property>#</property>\\n#g" },
                    stdin = true,
                },
                shfmt = {
                    -- -i 2: indent with 2 spaces (change to "-i", "4" for 4 spaces)
                    -- -ci: correctly indent switch cases
                    -- -sr: add space after redirect operators
                    prepend_args = { "-i", "2", "-ci", "-sr" },
                },
                sql_formatter = {
                    prepend_args = { "--language", "hive", "--config", '{"keywordCase": "upper"}' },
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
                python = { "ruff" },
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
