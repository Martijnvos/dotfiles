-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()

if package.loaded["cmp_nvim_lsp"] then
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
end

-- Vim Diagnostics
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
vim.keymap.set("n", "<leader>dll", vim.diagnostic.setloclist, {buffer=0})

vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float)

-- C#
require'lspconfig'.csharp_ls.setup{
    capabilities = capabilities,
    on_attach = function()
        -- Actions
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})

        -- Dialogs
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help, {buffer=0})

        -- Options
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
    end,
}
