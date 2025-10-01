vim.g.mapleader = " "
vim.o.timeoutlen = 500

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.tabstop = 2

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.swapfile = false
vim.o.undofile = true

-- transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "None" })

vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("*"),
  },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  -- FIXME: See info at
  -- https://github.com/stevearc/conform.nvim/issues/752
  {
    src = "https://github.com/stevearc/conform.nvim",
    version = "f9ef25a7ef00267b7d13bfc00b0dea22d78702d5",
  },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/nvim-mini/mini.files" },
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

require("mini.files").setup()

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff" },

    ["*"] = { "trim_whitespace" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_after_save = {},
})

vim.lsp.enable({
  "clangd",
  "gopls",
  "lua_ls",
  "rust_analyzer",
  "ty",
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

local map = vim.keymap.set
-- shortcuts
map("n", "<leader>s", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

-- language servers
map("n", "<leader>a", vim.lsp.buf.code_action)
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "<leader>f", function()
  require("conform").format({ async = true })
end)
map("n", "<leader>r", vim.lsp.buf.rename)
map("n", "[g", function()
  vim.diagnostic.jump({ count = -1 })
end)
map("n", "]g", function()
  vim.diagnostic.jump({ count = 1 })
end)

-- files
map("n", "<leader>sb", MiniPick.builtin.buffers)
map("n", "<leader>sf", function()
  MiniPick.builtin.files({ tools = "git" })
end)
map("n", "<leader>sg", MiniPick.builtin.grep_live)
map("n", "<leader>e", MiniFiles.open)
