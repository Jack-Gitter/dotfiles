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
    end,
    event = { "BufReadPost", "BufNewFile" },
}
