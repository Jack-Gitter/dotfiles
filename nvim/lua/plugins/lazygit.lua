return {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
        'LazyGit',
        'LazyGitConfig',
        'LazyGitCurrentFile',
        'LazyGitFilter',
        'LazyGitFilterCurrentFile',
    },
    keys = {
        { '<leader>git', '<cmd>LazyGit<cr>', desc = 'LazyGit' }
    },
}
