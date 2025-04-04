local util = require 'utils.utils'

local root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
}

local function organize_imports()
    local params = {
        command = 'pyright.organizeimports',
        arguments = { vim.uri_from_bufnr(0) },
    }

    local clients = util.get_lsp_clients {
        bufnr = vim.api.nvim_get_current_buf(),
        name = 'pyright',
    }
    for _, client in ipairs(clients) do
        client.request('workspace/executeCommand', params, nil, 0)
    end
end

local function set_python_path(path)
    local clients = util.get_lsp_clients {
        bufnr = vim.api.nvim_get_current_buf(),
        name = 'pyright',
    }
    for _, client in ipairs(clients) do
        if client.settings then
            client.settings.python = vim.tbl_deep_extend('force', client.settings.python, { pythonPath = path })
        else
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings,
                { python = { pythonPath = path } })
        end
        client.notify('workspace/didChangeConfiguration', { settings = nil })
    end
end


local on_attach = function(client, _)
    if client.supports_method("textDocument/hover") then
        vim.keymap.set("n", "<leader>ho", function() vim.lsp.buf.hover({ border = "single" }) end,
            { buffer = true })
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
    root_dir = root_markers,
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
    commands = {
        PyrightOrganizeImports = {
            organize_imports,
            description = 'Organize Imports',
        },
        PyrightSetPythonPath = {
            set_python_path,
            description = 'Reconfigure pyright with the provided python path',
            nargs = 1,
            complete = 'file',
        },
    },
}
