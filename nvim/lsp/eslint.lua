local utils = require("utils.utils")

local lsp = vim.lsp

local fix_all = function(opts)
    opts = opts or {}

    local eslint_lsp_client = utils.get_active_client_by_name(opts.bufnr, 'eslint')
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

    local bufnr = utils.validate_bufnr(opts.bufnr or 0)
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

local function get_eslint_closest_dir()
    local cwd = vim.fn.getcwd()
    local eslint_node_modules = vim.fn.finddir('node_modules/eslint', cwd .. ';')

    if eslint_node_modules == '' then
        return nil
    end

    if eslint_node_modules == 'node_modules/eslint' then
        return cwd
    end

    -- Strip the node_modules/eslint part
    return eslint_node_modules:match '(.*)/node_modules/eslint'
end

local root_markers = {
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

-- return {
--     cmd = { 'vscode-eslint-language-server', '--stdio' },
--     filetypes = {
--         'javascript',
--         'javascriptreact',
--         'javascript.jsx',
--         'typescript',
--         'typescriptreact',
--         'typescript.tsx',
--         'vue',
--         'svelte',
--         'astro',
--     },
--     commands = {
--         EslintFixAll = {
--             function()
--                 fix_all { sync = true, bufnr = 0 }
--             end,
--             description = 'Fix all eslint problems for this buffer',
--         },
--     },
--     root_markers = root_markers,
--     -- on_attach = function(_, bufnr)
--     --     vim.api.nvim_create_autocmd("BufWritePre", {
--     --         buffer = bufnr,
--     --         command = "EslintFixAll",
--     --     })
--     -- end,
--     settings = {
--         validate = 'on',
--         packageManager = nil,
--         useESLintClass = false,
--         experimental = {
--             useFlatConfig = false,
--         },
--         codeActionOnSave = {
--             enable = false,
--             mode = 'all',
--         },
--         format = true,
--         quiet = false,
--         onIgnoredFiles = 'off',
--         rulesCustomizations = {},
--         run = 'onType',
--         problems = {
--             shortenToSingleLine = false,
--         },
--         nodePath = '',
--         workingDirectory = { mode = 'location' },
--         codeAction = {
--             disableRuleComment = {
--                 enable = true,
--                 location = 'separateLine',
--             },
--             showDocumentation = {
--                 enable = true,
--             },
--         },
--     },
--     handlers = {
--         ['eslint/openDoc'] = function(_, result)
--             if result then
--                 vim.ui.open(result.url)
--             end
--             return {}
--         end,
--         ['eslint/confirmESLintExecution'] = function(_, result)
--             if not result then
--                 return
--             end
--             return 4
--         end,
--         ['eslint/probeFailed'] = function()
--             vim.notify('[lspconfig] ESLint probe failed.', vim.log.levels.WARN)
--             return {}
--         end,
--         ['eslint/noLibrary'] = function()
--             vim.notify('[lspconfig] Unable to find ESLint library.', vim.log.levels.WARN)
--             return {}
--         end,
--     },
-- }
