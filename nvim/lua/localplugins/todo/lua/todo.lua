local M = {}

M.state = {
    buf = -1,
    win = -1
}

local write_buffer = function(filename)
    local lines = vim.api.nvim_buf_get_lines(M.state.buf, 0, -1, false)

    local cwd = vim.fn.getcwd()
    local full_path = cwd .. "../" .. filename
    local file = io.open(full_path, "w")

    if file then
        for _, line in ipairs(lines) do
            file:write(line .. "\n")
        end
        file:close()
    end
end

local read_file = function(filename)
    local cwd = vim.fn.getcwd()
    local full_path = cwd .. "../" .. filename
    local file = io.open(full_path, "r")
    if file then
        local file_contents = file:read("*a")
        file:close()
        return file_contents
    end
end

local open_popup = function(filename)
    M.state.buf = vim.api.nvim_create_buf(false, false)


    local opts = {
        relative = 'editor',
        width = 80,
        height = 20,
        col = math.floor((vim.o.columns - 80) / 2),
        row = math.floor((vim.o.lines - 20) / 2),
        style = 'minimal',
        border = 'single',
    }

    vim.api.nvim_buf_set_lines(M.state.buf, 0, -1, false, vim.split(read_file(filename), "\n"))
    M.state.win = vim.api.nvim_open_win(M.state.buf, true, opts)
end


local close_existing_popup = function(filename)
    write_buffer(filename)
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
    if M.state.win ~= -1 and M.window_exists(M.state.win) then
        close_existing_popup(filename)
    else
        open_popup(filename)
    end
end

M.setup = function()
    vim.keymap.set("n", "<leader>td", function() toggle_popup("todo.txt") end)
end

return M
