return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{

		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "ts_ls","powershell_es" },
      auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
			lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig.powershell_es.setup({
        bundle_path = './PowerShellEditorServices/',
        files = {"ps1","psm1" },
        capabilities = capabilities,
        cmd = {'pwsh','-nologo','-noprofile','-command','./PowerShellEditorServices/Start-EditorServices.ps1 -SessionDetailsPath ./session.json'}
      })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
