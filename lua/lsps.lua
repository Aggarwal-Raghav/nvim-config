require("mason_conf")

-- -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
-- require("neodev").setup({
--   -- add any options here, or leave empty to use the default settings
-- })

local lspconfig = require("lspconfig")

local function default_lsp_handler(server_name)
    local opts = vim.tbl_deep_extend("force", require("lsp").common_opts(), {})
    lspconfig[server_name].setup(opts)
end

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    default_lsp_handler,
    -- Next, you can provide a dedicated handler for specific servers.
    ["gopls"] = function()
        require("lsp.go-ls")
    end,
    ["yamlls"] = function()
        require("lspconfig").yamlls.setup {
            settings = {
                yaml = {
                    schemaStore = {
                        -- You must disable built-in schemaStore support if you want to use
                        -- schemastore.nvim and its advanced options like `ignore`.
                        enable = false,
                        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                        url = "",
                    },
                    schemas = require("schemastore").yaml.schemas(),
                },
            },
        }
    end,
    ["jsonls"] = function()
        require("lspconfig").jsonls.setup {
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
        }
    end,
    -- ["pest_ls"] = function()
    -- 	require("pest-vim").setup(require("lsp").common_opts())
    -- end,
}

local executable_handlers = {
    ["efm-langserver"] = function()
        require("lsp.efmls")
    end,
    ["lua-language-server"] = function()
        require("lsp.lua-ls")
    end,
    ["nil"] = function()
        default_lsp_handler("nil_ls")
    end,
    ["pyright"] = function()
        default_lsp_handler("pyright")
    end,
    ["rust-analyzer"] = function()
        require("lsp.rust-ls")
    end,
    ["typescript-language-server"] = function()
        default_lsp_handler("tsserver")
    end,
    ["terraform-ls"] = function()
        default_lsp_handler("terraformls")
    end,
    ["taplo"] = function()
        default_lsp_handler("taplo")
    end,

    -- these come from vscode-langservers-extracted
    ["vscode-eslint-language-server"] = function()
        default_lsp_handler("eslint")
    end,
    ["vscode-html-language-server"] = function()
        default_lsp_handler("html")
    end,
    ["vscode-json-language-server"] = function()
        default_lsp_handler("jsonls")
    end,
    ["vscode-css-language-server"] = function()
        default_lsp_handler("cssls")
    end,
}

-- this handles both cases:
-- 1. the lsp is installed by mason
-- 2. the lsp is installed in the system (e.g. nixos or home-manager)
for exe_name, handler in pairs(executable_handlers) do
    if vim.fn.executable(exe_name) ~= 0 then
        handler()
    end
end

-- require("lspconfig").pest_ls.setup {}
