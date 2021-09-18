return require('packer').startup(function()
  --[[Text operations]]
  use 'tpope/vim-surround'
  use 'preservim/nerdcommenter'
  use 'tommcdo/vim-exchange'
  use 'godlygeek/tabular'
  use 'nicwest/vim-camelsnek'

  --[[Custom text objects]]
  use 'kana/vim-textobj-user'
  use 'sgur/vim-textobj-parameter'

  --[[VCS]]
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'

  use 'ctrlpvim/ctrlp.vim'

  --[[Themes]]
  use 'ayu-theme/ayu-vim'
  use 'jdsimcoe/panic.vim'
  use 'lifepillar/vim-wwdc16-theme'
  use 'tjammer/focusedpanic.vim'
  use 'pgavlin/pulumi.vim'
  use 'arzg/vim-colors-xcode'
  use 'ParamagicDev/vim-medic_chalk'
  use 'atahabaki/archman-vim'
  use 'Rigellute/shades-of-purple.vim'
  use 'rakr/vim-colors-rakr'
  use 'folke/lsp-colors.nvim'
  use "projekt0n/github-nvim-theme"
  use "cseelus/vim-colors-lucid"
  use "KurtPreston/vimcolors"

  --[[LSP]]
  use 'neovim/nvim-lspconfig'
  use {'glepnir/lspsaga.nvim', branch = 'main' }
  use 'hrsh7th/nvim-compe'
  use { 'nvim-treesitter/nvim-treesitter', branch= '0.5-compat', run = ":TSUpdate"} 
  use 'kyazdani42/nvim-web-devicons'
  use { 'folke/trouble.nvim', branch = 'main' }
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  --[[Vim UI]]
  use 'vim-airline/vim-airline'
  use 'airblade/vim-gitgutter'
  use 'vim-scripts/RltvNmbr.vim'

  --[[Misc]]
  use 'tpope/vim-dispatch'
  use 'radenling/vim-dispatch-neovim'
  use 'Shougo/echodoc.vim'
  use 'ap/vim-css-color'
  use 'kristijanhusak/vim-carbon-now-sh'
  use 'jiangmiao/auto-pairs'
  use 'xolox/vim-misc'
  use 'andymass/vim-matchup'
  use 'airblade/vim-rooter'
  use 'tpope/vim-eunuch'
end)
