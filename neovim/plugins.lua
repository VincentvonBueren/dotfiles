-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use {
        'folke/tokyonight.nvim',
        branch = 'main'
    }

    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'folke/trouble.nvim', 
        branch = 'main'
    } 

    use 'hoob3rt/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'

    use {
      'ms-jpq/coq_nvim',
      branch = 'coq'
    }

    use {
        'ms-jpq/coq.artifacts',
        branch = 'artifacts'
    }

    use 'lewis6991/impatient.nvim'

    use 'tpope/vim-dadbod'
    use "kristijanhusak/vim-dadbod-ui"

    use 'preservim/vim-pencil'
    use 'junegunn/goyo.vim'

    use 'jose-elias-alvarez/null-ls.nvim' 

  

end)
