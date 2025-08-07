local utils = require('utils')

-- Return empty table if npm isn't available
if not utils.has_npm() then
  return {}
end

return {
  'ravitemer/mcphub.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  build = 'npm install -g mcp-hub@latest', -- Installs `mcp-hub` node binary globally
  config = function()
    require('mcphub').setup()
  end,
}
