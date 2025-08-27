-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      { "zbirenbaum/copilot.lua", opts = {
        suggestion = { enabled = false }, -- Disable suggestion to use with cmp
        panel = { enabled = false }, -- Disable panel to use with cmp
      }},
      "zbirenbaum/copilot-cmp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        if client.server_capabilities.documentFormattingProvider then
          vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)
        end
      end

      -- Setup nvim-cmp
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- Example using vsnip, adjust if you use another snippet engine
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'copilot' }, -- Add Copilot as a completion source
          { name = 'buffer' },
          { name = 'path' },
        }),
      })

      -- Setup Copilot
      require("copilot").setup({})
      require("copilot_cmp").setup()

      -- Setup language servers
      local servers = { "gopls", "pyright", "ts_ls" }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end
    end,
  },
}
