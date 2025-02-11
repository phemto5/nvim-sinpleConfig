local M = {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
      -- ensure_installed = { "lua", "vim", "vimdoc", "query", "python","json","typescript","perl" },
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
    --    local treesitter_parser_config = require('nvim-treesitter.parsers').get_treesitter_parser_config.powershell = {
    --      install_info = {
    --      url = "~/.config/nvim/tsparsers/tree-sitter-powershell",
    --        files = { "src/parser.c", "src/scanner.c"},
    --        branch = "main",
    --        generate_requires_npm = false,
    --        requires_generate_from_grammer = false,
    --      },
    --      filetype = "ps1",
    --}
	end,
}

return { M }
