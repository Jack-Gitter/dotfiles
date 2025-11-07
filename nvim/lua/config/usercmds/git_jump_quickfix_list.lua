vim.api.nvim_create_user_command('GitMerge', function()
	local lines = vim.fn.systemlist('git jump --stdout merge')
	if vim.v.shell_error ~= 0 then
		vim.notify('git jump failed')
		return
	end
	vim.fn.setqflist({}, ' ', {
		title = 'git jump merge',
		lines = lines
	})
	vim.cmd('copen')
	vim.cmd('cfirst')
end, {})
