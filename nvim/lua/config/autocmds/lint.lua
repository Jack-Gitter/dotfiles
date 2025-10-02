local uv = vim.uv or vim.loop -- use vim.uv in newer Neovim

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
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        local root = clients[1] and clients[1].config.root_dir
        if root and has_eslint_config(root) then
            require('lint').try_lint()
        end
    end,
})
