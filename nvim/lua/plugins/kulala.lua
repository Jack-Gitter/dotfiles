return {
    'mistweaverco/kulala.nvim',
    keys = {
        { '<leader>rs', desc = 'Send request' },
        { '<leader>ra', desc = 'Send all requests' },
        { '<leader>rb', desc = 'Open scratchpad' },
    },
    ft = { 'http', 'rest' },
    opts = {
        global_keymaps = {
            ['Send request'] = {
                '<leader>rs',
                function() require('kulala').run() end,
                desc = 'Send request'
            },
            ['Send all requests'] = {
                '<leader>ra',
                function() require('kulala').run_all() end,
            },
            ['Replay the last request'] = {
                '<leader>rr',
                function() require('kulala').replay() end,
            },
            ['Find request'] = {
                '<leader>rs',
                function() require('kulala').search() end
            },
            ['Switch environments'] = {
                '<leader>re',
                function() require('kulala').set_selected_env() end

            }
        },
    },
}
