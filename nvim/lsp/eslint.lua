local util = require 'lspconfig.util'
local lsp = vim.lsp

local function fix_all(opts)
    opts = opts or {}

    local eslint_lsp_client = util.get_active_client_by_name(opts.bufnr, 'eslint')
    if eslint_lsp_client == nil then
        vim.print("we return!!!")
        return
    end

    local request
    if opts.sync then
        request = function(bufnr, method, params)
            eslint_lsp_client.request_sync(method, params, nil, bufnr)
        end
    else
        request = function(bufnr, method, params)
            eslint_lsp_client.request(method, params, nil, bufnr)
        end
    end

    local bufnr = util.validate_bufnr(opts.bufnr or 0)
    request(0, 'workspace/executeCommand', {
        command = 'eslint.applyAllFixes',
        arguments = {
            {
                uri = vim.uri_from_bufnr(bufnr),
                version = lsp.util.buf_versions[bufnr],
            },
        },
    })
end

local root_file = {
    '.eslintrc',
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    '.eslintrc.json',
    'eslint.config.js',
    'eslint.config.mjs',
    'eslint.config.cjs',
    'eslint.config.ts',
    'eslint.config.mts',
    'eslint.config.cts',
}

local function get_eslint_closest_dir()
    local cwd = vim.fn.getcwd()
    local eslint_node_modules = vim.fn.finddir('node_modules/eslint', cwd .. ';')

    if eslint_node_modules == '' then
        return nil
    end

    if eslint_node_modules == 'node_modules/eslint' then
        return cwd
    end

    return eslint_node_modules:match '(.*)/node_modules/eslint'
end

return {
    cmd = { 'vscode-eslint-language-server', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
        'vue',
        'svelte',
        'astro',
    },
    root_markers = root_file,
    on_attach = function(client, _)
        local root_dir = client.root_dir

        if root_dir == nil then
            return
        end

        if
            vim.fn.filereadable(root_dir .. '/eslint.config.js') == 1
            or vim.fn.filereadable(root_dir .. '/eslint.config.mjs') == 1
            or vim.fn.filereadable(root_dir .. '/eslint.config.cjs') == 1
            or vim.fn.filereadable(root_dir .. '/eslint.config.ts') == 1
            or vim.fn.filereadable(root_dir .. '/eslint.config.mts') == 1
            or vim.fn.filereadable(root_dir .. '/eslint.config.cts') == 1
        then
            client.settings.experimental.useFlatConfig = true
        end
        local pnp_cjs = root_dir .. '/.pnp.cjs'
        local pnp_js = root_dir .. '/.pnp.js'
        if vim.loop.fs_stat(pnp_cjs) or vim.loop.fs_stat(pnp_js) then
            client.cmd = vim.list_extend({ 'yarn', 'exec' }, client.cmd)
        end
    end,
    settings = {
        validate = 'on',
        packageManager = nil,
        workspaceFolder = {
            uri = get_eslint_closest_dir(),
            name = vim.fn.fnamemodify(get_eslint_closest_dir(), ':t'),
        },
        useESLintClass = false,
        experimental = {
            useFlatConfig = false,
        },
        codeActionOnSave = {
            enable = true,
            mode = 'all',
        },
        format = true,
        quiet = false,
        onIgnoredFiles = 'off',
        rulesCustomizations = {},
        run = 'onType',
        problems = {
            shortenToSingleLine = false,
        },
        nodePath = '',
        workingDirectory = { mode = 'location' },
        codeAction = {
            disableRuleComment = {
                enable = true,
                location = 'separateLine',
            },
            showDocumentation = {
                enable = true,
            },
        },
    },
    commands = {
        EslintFixAll = {
            function()
                fix_all({ sync = true, bufnr = 0 })
            end,
            description = 'Fix all eslint problems for this buffer',
        },
    },
}
