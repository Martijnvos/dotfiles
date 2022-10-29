-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if package.loaded["cmp_nvim_lsp"] then
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
end

-- Vim Diagnostics
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
vim.keymap.set("n", "<leader>dll", vim.diagnostic.setloclist, { buffer = 0 })

vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float)

-- General on_attach
local on_attach = function(client,bufnr)
    local bufopts = { buffer = bufnr }

    -- Actions
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, bufopts)

    -- Dialogs
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help, bufopts)

    -- Options
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
end

-- C#
-- Install with 'dotnet tool install --global csharp-ls'
require"lspconfig".csharp_ls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = {
        ["textDocument/definition"] = require("csharpls_extended").handler, -- Support decompilation
    },
}

-- Typescript
-- Install with 'npm install -g typescript typescript-language-server'
require"lspconfig".tsserver.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

-- CSS / HTML / JSON / ESLint (not configured atm)
-- Install with 'npm i -g vscode-langservers-extracted'
require"lspconfig".cssls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require"lspconfig".html.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require"lspconfig".jsonls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}
