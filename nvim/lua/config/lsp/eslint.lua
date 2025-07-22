local function fix_all(opts)
    opts = opts or {}

    local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
    vim.validate('bufnr', bufnr, 'number')

    local client = opts.client or vim.lsp.get_clients({ bufnr = bufnr, name = 'eslint' })[1]

    if not client then return end

    local request

    if opts.sync then
        request = function(buf, method, params) client:request_sync(method, params, nil, buf) end
    else
        request = function(buf, method, params) client:request(method, params, nil, buf) end
    end

    request(bufnr, 'workspace/executeCommand', {
        command = 'eslint.applyAllFixes',
        arguments = {
            {
                uri = vim.uri_from_bufnr(bufnr),
                version = vim.lsp.util.buf_versions[bufnr],
            },
        },
    })
end

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

local on_attach = function(client, bufnr)
    local root_dir = client.root_dir
    vim.api.nvim_create_user_command('EslintFixAll', function() fix_all({ client = client, sync = true }) end, {})

    if root_dir == nil then
        client.stop()
        return
    end

    vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
        pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
        command = 'silent! EslintFixAll',
    })


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

vim.lsp.config('eslint', {
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
    on_attach = on_attach,
    settings = {
        format = true,
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
})
