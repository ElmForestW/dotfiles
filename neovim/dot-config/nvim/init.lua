vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.timeoutlen = 500

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.tabstop = 2

vim.o.undofile = true

-- transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "None" })

vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.0") },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
})

require("vim._extui").enable({})

require("blink.cmp").setup({
	keymap = {
		preset = "enter",
	},
	completion = {
		list = {
			selection = {
				preselect = false,
			},
		},
	},
})

require("mini.pick").setup({
	options = {
		use_cache = true,
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff" },

		["*"] = { "trim_whitespace" },
	},
	-- FIXME: this currently does not work, see info at
	-- https://github.com/stevearc/conform.nvim/issues/752
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_after_save = {},
})

vim.lsp.enable({
	"clangd",
	"gopls",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"zls",
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

-- shortcuts
vim.keymap.set("n", "<leader>s", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- language servers
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "[g", function()
	vim.diagnostic.jump({ count = -1 })
end)
vim.keymap.set("n", "]g", function()
	vim.diagnostic.jump({ count = 1 })
end)

-- mini.pick
vim.keymap.set("n", "<leader>sb", MiniPick.builtin.buffers)
vim.keymap.set("n", "<leader>sf", function()
	MiniPick.builtin.files({ tools = "git" })
end)
vim.keymap.set("n", "<leader>sg", MiniPick.builtin.grep_live)
