local M = {}

local opts = {
    fullpath = vim.fn.expand("%:p") .. '/../todo.md',
    keymap = '<leader>td',
    win_opts = {
        relative = 'editor',
        width = 80,
        height = 20,
        col = math.floor((vim.o.columns - 80) / 2),
        row = math.floor((vim.o.lines - 20) / 2),
        style = 'minimal',
        border = 'single',
        title = 'TODO',
        title_pos = 'center'
    }
}

local state = {
    buf = -1,
    win = -1
}

local open_popup = function()
    state.buf = vim.api.nvim_create_buf(false, false)

    local win_opts = opts.win_opts

    state.win = vim.api.nvim_open_win(state.buf, true, win_opts)
    vim.cmd("edit" .. opts.fullpath)
end

local close_popup = function()
    vim.api.nvim_win_close(state.win, true)
    vim.api.nvim_buf_delete(state.buf, { force = true })
end

local window_exists = function(window_id)
    local windows = vim.api.nvim_list_wins()
    for _, win_id in ipairs(windows) do
        if win_id == window_id then
            return true
        end
    end
    return false
end

local toggle_popup = function()
    if window_exists(state.win) then
        close_popup()
    else
        open_popup()
    end
end

M.setup = function(input_opts)
    for k, v in pairs(input_opts) do opts[k] = v end
    vim.keymap.set("n", opts.keymap, function() toggle_popup() end)
end

return M
