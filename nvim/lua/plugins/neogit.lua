return {
    "NeogitOrg/neogit",
    dependencies = {
        {
            "diffview.nvim",
        },
        {
            "nvim-lua/plenary.nvim"
        },
        {
            "ibhagwan/fzf-lua"
        },
    },
    opts = {
        kind = "floating",
        commit_editor = {
            kind = "floating",
            show_staged_diff = false,
        },
        preview_buffer = {
            kind = "floating",
        },
        commit_select_view = {
            kind = "floating",
        },
        log_view = {
            kind = "floating",
        },
        mappings = {
            popup = {
                ["w"] = false
            }
        }
    },
    config = function(_, opts)
        local neogit = require("neogit")
        neogit.setup(opts)
        vim.keymap.set("n", "<leader>git", neogit.open)
        vim.keymap.set("n", "<leader>gc", function() neogit.open({ "commit" }) end)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "NeogitStatus",
            callback = function()
                vim.keymap.set("n", "<esc>", ":q<cr>", { buffer = true })
            end
        })
    end,
    keys = { "<leader>git" },
}
