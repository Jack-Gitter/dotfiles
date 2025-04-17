local on_attach = function(client, bufnr)
    require('workspace-diagnostics').populate_workspace_diagnostics(client, bufnr)

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

    vim.cmd('compiler tsc')
    vim.o.makeprg = 'npx tsc'
end

local root_markers = {
    'tsconfig.json', 'jsconfig.json', 'package.json', '.git'
}

vim.lsp.config('ts_ls', {
    init_options = { hostInfo = 'neovim' },
    on_attach = on_attach,
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
    },
    root_markers = root_markers,
    single_file_support = true,
    settings = {
        completions = {
            completeFunctionCalls = true
        }
    },
})
