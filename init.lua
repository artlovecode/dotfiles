local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end


local plugins = require("plugins")
local commands = require("commands")

vim.g.mapleader = ","
vim.cmd("colorscheme pink-moon")
vim.g.background = "dark"
vim.g.rooter_patterns = { 'Taskfile.yml',  'go.mod', 'Makefile', 'Dockerfile', '.git/' }

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
on_attach = require("on_attach")
-- Autocompletion
require'compe'.setup {
}

require'nvim-treesitter.configs'.setup {
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
  },
  highlight = {
  enable = true,
  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  -- Using this option may slow down your editor, and you may see some duplicate highlights.
  -- Instead of true it can also be a list of languages
  additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}

require("trouble").setup {
}
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>gi", "<cmd>Trouble lsp_implementations<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>Trouble lsp_definitions<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>Telescope find_files<CR>",
  {silent = true, noremap = true}
)

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "gopls", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
      }
    }
end

vim.g["test#javascript#runner"] = "yarn test"
vim.g["test#strategy"] = "neovim"
vim.g["test#javascript#jest#options"] = {
  all = "--silent",
}

require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

