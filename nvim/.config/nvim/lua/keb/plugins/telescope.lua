return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

        telescope.setup({
            defaults = {
                layout_strategy = 'flex',
                layout_config = {
                    width = {
                        padding = 0
                    },
                    height = {
                        padding = 0
                    }
                },
            },
        })
    end
}
