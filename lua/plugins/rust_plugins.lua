return {
    {
        "mrcjkb/rustaceanvim",
        version = "^9", -- Recommended
        lazy = false, -- This plugin is already lazy
    },
    {
        "mrjones2014/codesettings.nvim",
        opts = {},
        init = function()
            vim.lsp.config("*", {
                before_init = function(_, config)
                    local codesettings = require("codesettings")
                    codesettings.with_local_settings(config.name, config)
                end,
            })
        end,
    },
}
