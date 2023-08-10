-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path
        })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs / updates / removes plugins
-- when the file is saved.
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

--import packer safely
local status, packer = pcall(require, "packer")
if not status then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
    log = { level = "trace"},
})

-- the plugin goes here
return packer.startup(function(use)

    use("wbthomason/packer.nvim") -- packer can manage itself, so this is packer

    use("bluz71/vim-nightfly-guicolors") -- preferred color scheme. This is literally a git repo which has the theme.

    use("christoomey/vim-tmux-navigator") -- tmux and split window navigation, use ctrl h,j,k,l to move between splits

    use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

    use("szw/vim-maximizer") -- maximizes and restores current window

    -- essential plugins
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")

    -- commenting with GC
    use("numToStr/Comment.nvim")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")

    -- icons
    use("kyazdani42/nvim-web-devicons")

    -- status line
    use("nvim-lualine/lualine.nvim")

    -- fuzzy finding using telescope
    -- first line is a dependency and second line is actual telescope installation
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

    -- auto-completion and basic code completion
    use("hrsh7th/nvim-cmp") -- plugin for auto completion
    use("hrsh7th/cmp-buffer") -- source text from buffers for completion
    use("hrsh7th/cmp-path") -- source files in this file path for completion

    -- snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- show lua snippets for auto completion
    use("rafamadriz/friendly-snippets") -- friendly sets of snippets

    -- managing and installing lsp servers
    -- primary source of truth for managing and isntall lsp servers. LSP is built into Neovim but LSP servers need to be installed.
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim") -- help us bridge gap between mason and nvim lsp config

    -- configuring lsp servers
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp") -- will allow us to configure lsp configure so that they appear in auto completion
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced ui to lsp experience 
    use("jose-elias-alvarez/typescript.nvim") -- add further functionality to typescript server
    use("onsails/lspkind.nvim") -- vscode like icons to auto completion window

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
