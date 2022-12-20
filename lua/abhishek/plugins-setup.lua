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

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)

