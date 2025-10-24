return {
  'everviolet/nvim', name = 'evergarden',
  priority = 1000,
  opts = {
    theme = {
      variant = 'spring',
      accent = 'green',
    },
    editor = {
      transparent_background = false,
      sign = { color = 'none' },
      float = {
        color = 'mantle',
        solid_border = false,
      },
      completion = {
        color = 'surface0',
      },
    },
  },
  config = function(_, opts)
      local evergarden = require('evergarden')
      evergarden.setup(opts)
      vim.cmd('colorscheme evergarden')
  end
}
