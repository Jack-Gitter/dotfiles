return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'nvim-dap',
        'nvim-neotest/nvim-nio'
    },
    config = function(_, opts)
        local dap, dapui = require('dap'), require('dapui')
        dapui.setup(opts)
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
    keys = { '<leader>dg', '<leader>dso', '<leader>dsi', '<leader>dst', '<leader>tb', '<leader>dr', '<leader>dcl', '<leader>??' },
    lazy = true
}
