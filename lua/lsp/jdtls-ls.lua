local opts = vim.tbl_deep_extend("force", require("lsp").common_opts(), {
    root_dir = function(fname)
        local root_markers = { "mvnw", "gradlew", "settings.gradle", "settings.gradle.kts", ".git", "build.xml", "pom.xml", "build.gradle", "build.gradle.kts" }
        local root = vim.fs.root(fname, root_markers)
        if not root then
            -- Fallback to directory of the file to prevent jdtls from crashing with null uri
            root = vim.fn.fnamemodify(fname, ":h")
        end
        return root
    end
})

vim.lsp.config("jdtls", opts)
vim.lsp.enable("jdtls")
