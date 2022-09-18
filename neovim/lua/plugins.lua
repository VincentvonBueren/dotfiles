local M = {}

function M.setup()

    local function packer_init()
        local fn = vim.fn
        local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
        if fn.empty(fn.glob(install_path)) > 0 then
            fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
            vim.cmd [[packadd packer.nvim]]
        end

        -- Run PackerCompile if there are changes in this file
        -- vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
        local packer_grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
        vim.api.nvim_create_autocmd(
            { "BufWritePost" },
            { pattern = "init.lua", command = "source <afile> | PackerCompile", group = packer_grp }
        )
    end

    local function plugins(use)
        use { 'wbthomason/packer.nvim' }
        use { 'lewis6991/impatient.nvim' }
        use { 'nvim-lua/plenary.nvim' }
        use {
            'folke/tokyonight.nvim',
            branch = 'main',
            config = function()
                vim.cmd "colorscheme tokyonight"
            end,
        }

        use {
            "neovim/nvim-lspconfig",
            ensure_dependencies = true,
            config = function()
                require("lsp")
            end,
            requires = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
            }
        }
        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require("indent_blankline").setup {
                    char = "|",
                    buftype_exclude = { "terminal" }
                }
            end,
        }
        use {
            'kyazdani42/nvim-web-devicons',
        }
        use {
            'hoob3rt/lualine.nvim',
            --        after = { "nvim-treesitter/nvim-treesitter", "folke/tokyonight.nvim" },
            ensure_dependencies = true,
            config = function()
                require("lualine").setup {
                    options = {
                        theme = "tokyonight"
                    }
                }
            end,
            --       requires = { "kyazdani42/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" ,"folke/tokyonight.nvim" }
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function()
                require("config.treesitter")
            end
        }

        use {
            'nvim-telescope/telescope.nvim',
            ensure_dependencies = true,
            requires = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim"
            },
            config = function()
                require("config.telescope")
            end
        }
        use {
            'folke/trouble.nvim',
            --            cmd = { "TroubleToggle", "Trouble" },
            config = function()
                require("config.trouble").setup()
                --             require("trouble").setup {
                --                 use_diagnostic_signs = true,
                --             }
            end,
            branch = 'main'
        }
        use {
            'ms-jpq/coq_nvim',
            ensure_dependencies = true,
            branch = 'coq',
            run = ":COQdeps",
            requires = {
                { "ms-jpq/coq.artifacts", branch = "artifacts" },
            },
        }
    end

    packer_init()
    local packer = require 'packer'

    packer.startup(plugins)
end

return M
