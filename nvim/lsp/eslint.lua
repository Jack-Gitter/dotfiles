local util = require 'lspconfig.util'
local lsp = vim.lsp

local function fix_all(opts)
    opts = opts or {}

    local eslint_lsp_client = util.get_active_client_by_name(opts.bufnr, 'eslint')
    if eslint_lsp_client == nil then
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
    settings = {
        validate = 'on',
        packageManager = nil,
        useESLintClass = false,
        experimental = {
            useFlatConfig = false,
        },
        codeActionOnSave = {
            enable = false,
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
    on_attach = function(config, new_root_dir)
        new_root_dir = get_eslint_closest_dir() or new_root_dir
        config.settings.workspaceFolder = {
            uri = new_root_dir,
            name = vim.fn.fnamemodify(new_root_dir, ':t'),
        }
        if
            vim.fn.filereadable(new_root_dir .. '/eslint.config.js') == 1
            or vim.fn.filereadable(new_root_dir .. '/eslint.config.mjs') == 1
            or vim.fn.filereadable(new_root_dir .. '/eslint.config.cjs') == 1
            or vim.fn.filereadable(new_root_dir .. '/eslint.config.ts') == 1
            or vim.fn.filereadable(new_root_dir .. '/eslint.config.mts') == 1
            or vim.fn.filereadable(new_root_dir .. '/eslint.config.cts') == 1
        then
            config.settings.experimental.useFlatConfig = true
        end
        local pnp_cjs = new_root_dir .. '/.pnp.cjs'
        local pnp_js = new_root_dir .. '/.pnp.js'
        if vim.loop.fs_stat(pnp_cjs) or vim.loop.fs_stat(pnp_js) then
            config.cmd = vim.list_extend({ 'yarn', 'exec' }, config.cmd)
        end
    end,
    handlers = {
        ['eslint/openDoc'] = function(_, result)
            if result then
                vim.ui.open(result.url)
            end
            return {}
        end,
        ['eslint/confirmESLintExecution'] = function(_, result)
            if not result then
                return
            end
            return 4 -- approved
        end,
        ['eslint/probeFailed'] = function()
            vim.notify('[lspconfig] ESLint probe failed.', vim.log.levels.WARN)
            return {}
        end,
        ['eslint/noLibrary'] = function()
            vim.notify('[lspconfig] Unable to find ESLint library.', vim.log.levels.WARN)
            return {}
        end,
    },
    commands = {
        EslintFixAll = {
            function()
                fix_all { sync = true, bufnr = 0 }
            end,
            description = 'Fix all eslint problems for this buffer',
        },
    },
}
