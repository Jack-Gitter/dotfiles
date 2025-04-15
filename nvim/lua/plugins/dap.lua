return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'leoluz/nvim-dap-go'
    },
    config = function()
        local dap = require('dap')

        require('dap-go').setup()

        vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointCondition', { text = '❓', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '🛑', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointRejected', { text = '❌', texthl = '', linehl = '', numhl = '' })

        vim.keymap.set('n', '<leader>dg', function() dap.continue() end)
        vim.keymap.set('n', '<leader>dso', function() dap.step_over() end)
        vim.keymap.set('n', '<leader>dsi', function() dap.step_into() end)
        vim.keymap.set('n', '<leader>dst', function() dap.step_out() end)
        vim.keymap.set('n', '<Leader>tb', function() dap.toggle_breakpoint() end)
        vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
        vim.keymap.set('n', '<Leader>dcl', function() dap.goto_() end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>??', function()
            require('dap.ui.widgets').hover()
        end)

        dap.adapters['pwa-node'] = {
            type = 'server',
            host = 'localhost',
            port = '${port}',
            executable = {
                command = 'node',
                args = { vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '${port}' },
            }
        }
        dap.configurations.javascript = {
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'Launch file with node',
                program = '${file}',
                cwd = '${workspaceFolder}',
            },
            {
                type = 'pwa-node',
                request = 'attach',
                name = 'Attach',
                processId = require('dap.utils').pick_process,
                cwd = '${workspaceFolder}',
            }
        }
        dap.configurations.typescript = {
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'Launch file with ts-node',
                program = '${file}',
                cwd = '${workspaceFolder}',
                sourceMaps = true,
            },
            {
                type = 'pwa-node',
                request = 'attach',
                name = 'Attach to a NestJS project',
                processId = require('dap.utils').pick_process,
                cwd = '${workspaceFolder}',
                sourceMaps = true,
                outFiles = { '${workspaceFolder}/dist/**/*.js' },
            }
        }
    end,
    keys = { '<leader>dg', '<leader>dso', '<leader>dsi', '<leader>dst', '<leader>tb', '<leader>dr', '<leader>dcl', '<leader>??' },
    lazy = true
}
