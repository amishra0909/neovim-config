-- we are going to do two imports here
-- first one is to import telescope
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end

-- second one is for some actions so that we can setup some custom keymaps
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    return
end

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            }
        }
    }
})

telescope.load_extension("fzf")
