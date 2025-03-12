local M = {}

M.state = {
    buf = -1,
    win = -1
}

local open_popup = function(filename)
    M.state.buf = vim.api.nvim_create_buf(false, false)
    local full_path = vim.env.XDG_CONFIG_HOME .. '/nvim/lua/localplugins/todo/' .. filename
    local opts = {
        relative = 'editor',
        width = 80,
        height = 20,
        col = math.floor((vim.o.columns - 80) / 2),
        row = math.floor((vim.o.lines - 20) / 2),
        style = 'minimal',
        border = 'single',
    }

    M.state.win = vim.api.nvim_open_win(M.state.buf, true, opts)
    vim.cmd("edit" .. full_path)
end

local close_existing_popup = function()
    vim.api.nvim_win_close(M.state.win, true)
    vim.api.nvim_buf_delete(M.state.buf, { force = true })
    M.state.win = -1
    M.state.buf = -1
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

local toggle_popup = function(filename)
    if window_exists(M.state.win) then
        close_existing_popup()
    else
        open_popup(filename)
    end
end

M.setup = function()
    vim.keymap.set("n", "<leader>td", function() toggle_popup("todo.md") end)
end

return M
