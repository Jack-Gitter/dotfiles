local root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
}



local on_attach = function(client, _)
    if client.supports_method("textDocument/hover") then
        vim.keymap.set("n", "<leader>ho", function() vim.lsp.buf.hover({ border = "single" }) end,
            { buffer = true })
    end

    if client.supports_method("textDocument/codeAction") then
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_actions)
    end

    if client.supports_method("textDocument/diagnostics") then
        vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float)
    end

    if client.supports_method("textDocument/signatureHelp") then
        vim.keymap.set("i", "<c-;>", function() vim.lsp.buf.signature_help({ border = "single", title = "" }) end)
    end

    if client.supports_method("textDocument/rename") then
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    end
end



return {
    cmd = { 'pyright-langserver', '--stdio' },
    on_attach = on_attach,
    filetypes = { 'python' },
    root_markers = root_markers,
    single_file_support = true,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly',
            },
        },
    },
}
