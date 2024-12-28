-- Make line numbers relative to current line
vim.wo.relativenumber = true

-- Allways display N additional line above/below current line
vim.wo.so = 10

-- Highlight the current line
vim.wo.cursorline = true

-- timing and decrease update time
vim.o.timeout = true

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Use ctrl+hjkl to move between buffers
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Use J/K to move up/down one paragraph
vim.keymap.set('n', 'J', '}')
vim.keymap.set('n', 'K', '{')
vim.keymap.set('v', 'J', '}')
vim.keymap.set('v', 'K', '{')

-- Use H/L to move to start/end of a line
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('v', 'H', '^')
vim.keymap.set('v', 'L', '$')

-- Neotree keymaps
vim.keymap.set('n', '<leader>b', ":Neotree toggle<CR>", { desc = 'Toggle Neotree' })

-- Barbar keymaps
vim.keymap.set('n', '<Tab>', ":BufferNext<CR>", { silent = true })
vim.keymap.set('n', '<S-Tab>', ":BufferPrevious<CR>", { silent = true })
