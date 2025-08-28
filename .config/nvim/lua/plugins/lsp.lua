-- ~/.config/nvim/lua/plugins/lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
				config = function()
					require("mason").setup()
				end,
			},
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("mason-lspconfig").setup()
				end,
			},
			{ "j-hui/fidget.nvim", opts = { progress = { display = { render_limit = 16 } } } },
			{ "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" } },
			{ "L3MON4D3/LuaSnip", dependencies = { "saadparwaiz1/cmp_luasnip" } },
			{
				"stevearc/conform.nvim",
				opts = {
					formatters_by_ft = {
						lua = { "stylua" },
						python = { "black", "isort" },
						go = { "gofmt" },
						javascript = { "prettier" },
						typescript = { "prettier" },
					},
					format_on_save = { timeout_ms = 500, lsp_fallback = true },
				},
			},
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }
				local keymap = vim.keymap.set
				keymap("n", "gd", vim.lsp.buf.definition, opts)
				keymap("n", "gi", vim.lsp.buf.implementation, opts)
				keymap("n", "gr", vim.lsp.buf.references, opts)
				keymap("n", "K", vim.lsp.buf.hover, opts)
				keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
				keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				keymap("n", "<leader>lf", function()
					require("conform").format({ bufnr = bufnr, lsp_fallback = true })
				end, opts)
				keymap("n", "<leader>e", vim.diagnostic.open_float, opts)
				keymap("n", "[d", vim.diagnostic.goto_prev, opts)
				keymap("n", "]d", vim.diagnostic.goto_next, opts)
			end

			vim.diagnostic.config({
				virtual_text = { prefix = "●", source = "if_many" },
				signs = { text = { [vim.diagnostic.severity.ERROR] = "✘", [vim.diagnostic.severity.WARN] = "▲" } },
				update_in_insert = false,
				severity_sort = true,
			})

			-- Ensure mason-lspconfig is loaded and handle setup
			local mason_lspconfig = require("mason-lspconfig")
			if mason_lspconfig and mason_lspconfig.setup_handlers then
				mason_lspconfig.setup_handlers({
					function(server_name)
						lspconfig[server_name].setup({
							on_attach = on_attach,
							capabilities = capabilities,
						})
					end,
				})
			else
				print("mason-lspconfig setup_handlers not available, setting up servers manually")
				-- Fallback: Manual setup for known servers
				local servers = { "pyright", "gopls", "ts_ls", "lua_ls" }
				for _, lsp in ipairs(servers) do
					lspconfig[lsp].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end
			end

			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", max_item_count = 15 },
					{ name = "luasnip" },
					{ name = "buffer", keyword_length = 3 },
					{ name = "path" },
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})
		end,
	},
}
