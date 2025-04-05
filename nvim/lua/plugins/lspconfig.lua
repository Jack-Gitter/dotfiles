return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
        },
        {
            'saghen/blink.cmp'
        },
        {
            "williamboman/mason-lspconfig.nvim"
        },
        {
            "jay-babu/mason-nvim-dap.nvim"
        },
        {
            "artemave/workspace-diagnostics.nvim"
        }
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({ ensure_installed = { "ts_ls", "lua_ls", "gopls", "pyright", "eslint", } })
        require("mason-nvim-dap").setup({ ensure_installed = { "js", "delve" } })

        vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = '#5a4480', fg = 'white' })
    end
    event = { "BufReadPost", "BufNewFile" },
}
