return {
    "rcarriga/nvim-notify",
    opts = {
        background_colour = "#000000",
        timeout = "2000",
        render = "simple",
    },
    config = function(_, opts)
        local notify = require("notify")
        notify.setup(opts)
        vim.notify = notify.notify
    end

}
