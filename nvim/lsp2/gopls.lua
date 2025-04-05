local on_attach = function(client, bufnr)
    local ft = vim.bo.filetype

    if client.supports_method("textDocument/hover") then
        vim.keymap.set("n", "<leader>ho", function() vim.lsp.buf.hover({ border = "single" }) end,
            { buffer = true })
    end

    if client.supports_method("textDocument/diagnostics") then
        vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float)
    end


    if client.supports_method("textDocument/codeAction") then
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_actions)
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end
    })

    if client.supports_method("textDocument/signatureHelp") then
        vim.keymap.set("i", "<c-;>", function() vim.lsp.buf.signature_help({ border = "single", title = "" }) end)
    end


    if client.supports_method("textDocument/rename") then
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    end
end




return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl', '.git' },
    on_attach = on_attach,
    root_markers = { 'go.work', 'go.mod', '.git' },
    single_file_support = true,
    settings = {
        gopls = {
            symbolScope = "workspace",
        }
    },
}
