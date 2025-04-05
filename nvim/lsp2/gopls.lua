return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_dir = function(fname)
      if not mod_cache then
        local result = async.run_command { 'go', 'env', 'GOMODCACHE' }
        if result and result[1] then
          mod_cache = vim.trim(result[1])
        else
          mod_cache = vim.fn.system 'go env GOMODCACHE'
        end
      end
      if mod_cache and fname:sub(1, #mod_cache) == mod_cache then
        local clients = util.get_lsp_clients { name = 'gopls' }
        if #clients > 0 then
          return clients[#clients].config.root_dir
        end
      end
      return util.root_pattern('go.work', 'go.mod', '.git')(fname)
    end,
    single_file_support = true,
}
