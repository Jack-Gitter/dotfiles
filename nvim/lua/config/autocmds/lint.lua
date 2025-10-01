local uv = vim.loop

local eslint_configs = {
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.json',
    '.eslintrc.yml',
    '.eslintrc.yaml',
    'eslint.config.js',
    'eslint.config.cjs',
}

local function has_eslint_config(root)
    for _, fname in ipairs(eslint_configs) do
        if uv.fs_stat(root .. '/' .. fname) then
            return true
        end
    end
    return false
end

vim.api.nvim_create_autocmd('BufWritePost', {
    callback = function()
        local root = (vim.lsp.get_active_clients({ bufnr = 0 })[1] or {}).config.root_dir
        if root and has_eslint_config(root) then
            require('lint').try_lint()
        end
    end,
})
