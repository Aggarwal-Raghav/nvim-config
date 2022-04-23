local nest = require('nest')
local ret = {}

function ret.common_on_attach(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  nest.applyKeymaps {
      { "g", {
          { "D", "<cmd>lua vim.lsp.buf.declaration()<cr>" },
          { "d", "<cmd>Telescope lsp_definitions<cr>" },
          { "i", "<cmd>Telescope lsp_implementations<cr>" },
          { "r", "<cmd>Telescope lsp_references<cr>" },
      }},
      { "K", "<cmd>lua vim.lsp.buf.hover()<cr>" },
      { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>" },
      { "<space>", {
          { "wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>" },
          { "wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>" },
          { "wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>" },
          { "D", "<cmd>lua vim.lsp.buf.type_definition()<cr>" },
          { "rn", "<cmd>lua vim.lsp.buf.rename()<cr>" },
          { "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>" },
          { "e", "<cmd>lua vim.diagnostic.open_float()<cr>" },
          { "q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>" },
      }},
      { "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>" },
      { "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>" },
  }

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    nest.applyKeymaps {
        { "<space>fo", "<cmd>lua vim.lsp.buf.formatting()<cr>" }
    }
  end
  if client.resolved_capabilities.document_range_formatting then
    nest.applyKeymaps {
        { mode = "v", {
            { "<space>fo", "<cmd>lua vim.lsp.buf.range_formatting()<cr>" }
        }},
    }
  end

  -- print(vim.inspect(client.resolved_capabilities))
  -- if client.resolved_capabilities.code_lens then
  --     print("virtual types active lets goo")
  --     require'virtualtypes'.on_attach(client, bufnr)
  -- end

  -- Set autocommands conditional on server_capabilities
  -- if client.resolved_capabilities.document_highlight then
  --   vim.api.nvim_exec([[
  --     hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
  --     hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
  --     hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
  --     augroup lsp_document_highlight
  --       autocmd! * <buffer>
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --     augroup END
  --   ]], false)
  -- end
end

return ret
