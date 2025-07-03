-- Python language server configuration
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }

  -- It's better practice to map to the lua function directly
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

  -- Conditionally set the formatting keymap only if the server supports it
  if client.server_capabilities.documentFormattingProvider then
    -- Use the modern 'vim.lsp.buf.format' function
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)
  end
end
require('lspconfig').pyright.setup({
  on_attach = on_attach,
})
