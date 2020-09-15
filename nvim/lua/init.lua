-- basic varibles
local vim = vim
local api = vim.api
local fn = vim.fn
local filetype = api.nvim_eval("&filetype")

-- Lsp
require'nvim_lsp'.pyls.setup {} -- pip install python-language-server
require'nvim_lsp'.tsserver.setup {} -- LspInstall tsserver
require'nvim_lsp'.vimls.setup {} -- LspInstall vimls
require'nvim_lsp'.sumneko_lua.setup {} -- LspInstall sumneko_lua
require'nvim_lsp'.bashls.setup {} -- LspInstall bashls
require'nvim_lsp'.clangd.setup {} -- ???
require'nvim_lsp'.cssls.setup {} -- LspInstall cssls
require'nvim_lsp'.html.setup {} -- LspInstall html
require'nvim_lsp'.rls.setup {} -- ???
require'nvim_lsp'.jsonls.setup {} -- LspInstall jsonls


require('format').setup({
  javascript = {
      prettier = function()
        returns {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
          stdin = true
        }
      end
  },
  lua = {
      luafmt = function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    }
})
