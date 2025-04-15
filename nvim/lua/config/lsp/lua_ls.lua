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

    vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
            vim.diagnostic.enable()
        end
    })

    if client.supports_method('textDocument/signatureHelp') then
        vim.keymap.set('i', '<c-;>', function() vim.lsp.buf.signature_help({ border = 'single', title = '' }) end)
    end

    if client.supports_method('textDocument/rename') then
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
    end
end


local root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
}

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    on_attach = on_attach,
    filetypes = { 'lua' },
    root_markers = root_markers,
    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            signatureHelp = { enabled = true },
            format = {
                enable = true,
                defaultConfig = {
                    quote_style = 'single'
                },
            },
            workspace = {
                checkThirdParty = 'Disable',
                ignoreDir = { '~/.local/' },
            },
            diagnostics = {
                libraryFiles = 'Disable',
                globals = { 'vim' }
            }
        }
    }

})
