-- Go language server configuration
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- Go to definition
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)       -- Show hover information
  vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts) -- Format code
end

require('lspconfig').gopls.setup({
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true, -- Enable unused parameter analysis
      },
      staticcheck = true,   -- Enable staticcheck
    },
  },
})
