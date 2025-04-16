local on_attach = function(client, bufnr)
    if client.supports_method('textDocument/hover') then
        vim.keymap.set('n', '<leader>ho', function() vim.lsp.buf.hover({ border = 'single' }) end,
            { buffer = true })
    end

    if client.supports_method('textDocument/codeAction') then
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
    end

    if client.supports_method('textDocument/diagnostics') then
        vim.keymap.set('n', '<leader>di', vim.diagnostic.open_float)
    end

    if client.supports_method('textDocument/signatureHelp') then
        vim.keymap.set('i', '<c-;>', function() vim.lsp.buf.signature_help({ border = 'single', title = '' }) end)
    end

    if client.supports_method('textDocument/rename') then
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
    end
end

vim.lsp.config('kulala_ls', {
    cmd = { 'kulala-ls', '--stdio' },
    filetypes = { 'http' },
    root_markers = { '.git' },
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    on_attach = on_attach,
})
