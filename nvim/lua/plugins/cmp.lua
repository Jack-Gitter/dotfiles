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
        },
    },
    config = function(_, opts)
        local cmp = require("cmp")


        opts.mapping = {
            ["<c-j>"] = function() cmp.select_next_item() end,
            ["<c-k>"] = function() cmp.select_prev_item() end,
            ["<c-cr>"] = function() cmp.confirm() end
        }

        vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "red", fg = "white" })

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
