return {
    'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<A-b>", ui.toggle_quick_menu)

        -- goated keymaps
        vim.keymap.set("n", "<A-h>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<A-t>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<A-n>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<A-s>", function() ui.nav_file(4) end)
        vim.keymap.set("n", "<A-m>", function() ui.nav_file(5) end)
        vim.keymap.set("n", "<A-w>", function() ui.nav_file(6) end)
        vim.keymap.set("n", "<A-v>", function() ui.nav_file(7) end)
        vim.keymap.set("n", "<A-z>", function() ui.nav_file(8) end)
    end
}
