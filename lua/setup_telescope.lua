-- Set to search hidden files
vim.api.nvim_set_var('telescope', {
    defaults = {
        file_ignore_patterns = { 'node_modules', 'dist', 'build', 'target', 'vendor', 'yarn.lock', 'package-lock.json' },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--glob',
            '!.git/**',
            '--glob',
            '!node_modules/**',
            '--glob',
            '!dist/**',
            '--glob',
            '!build/**',
            '--glob',
            '!target/**',
            '--glob',
            '!vendor/**',
            '--glob',
            '!yarn.lock',
            '--glob',
            '!package-lock.json',
        },
    },
})


-- Config telescope.nvim keybindings
vim.api.nvim_set_keymap('n', '<Leader>tf', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>th', ':Telescope help_tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tc', ':Telescope git_files<CR>', { noremap = true, silent = true })


-- init doc key
-- {'n'} <Leader>tf : find files
-- {'n'} <Leader>tg : live grep
-- {'n'} <Leader>tb : buffers
-- {'n'} <Leader>th : help tags
-- {'n'} <Leader>tc : git files
-- end doc key
