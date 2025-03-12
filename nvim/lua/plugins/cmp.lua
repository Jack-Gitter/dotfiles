return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        {
            "LuaSnip"
        },
        {
            "hrsh7th/cmp-nvim-lsp",
        },
        {
            "saadparwaiz1/cmp_luasnip"
        },
        {
            "hrsh7th/cmp-nvim-lua"
        }
    },
    opts = {
        snippet = {
            expand = function(args) require("luasnip").lsp_expand(args.body) end
        },
        sources = {
            { name = "nvim_lsp" },
            { name = 'luasnip' },
            { name = 'nvim_lua' },
            { name = 'render-markdown' },
        },
    },
    config = function(_, opts)
        local cmp = require("cmp")


        opts.mapping = {
            ["<c-j>"] = function() cmp.select_next_item() end,
            ["<c-k>"] = function() cmp.select_prev_item() end,
            ["<c-cr>"] = function() cmp.confirm() end,
            ['<cs-k>'] = cmp.mapping.scroll_docs(-4),
            ['<cs-j>'] = cmp.mapping.scroll_docs(4),
        }

        vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "#3dabcc", fg = "white" })

        opts.window = {
            completion = cmp.config.window.bordered({
                border = "single",
                winhighlight =
                "Normal:MyPmenu,CursorLine:MyPMenuSel"
            }),
            documentation = cmp.config.window.bordered({
                border = "single",
                winhighlight =
                "Normal:MyPmenu,CursorLine:MyPMenuSel"
            }),
        }
        cmp.setup(opts)
    end,
    event = { "BufReadPost", "BufNewFile" },
}
