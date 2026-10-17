-- Code context: diagnostics panel, outline, sticky scope header
vim.pack.add { { src = 'https://github.com/folke/trouble.nvim', version = vim.version.range '*' } }
require('trouble').setup {}
vim.keymap.set('n', '<leader>xx', '<Cmd>Trouble diagnostics toggle<CR>', { desc = 'Diagnostics: workspace (trouble)' })
vim.keymap.set('n', '<leader>xX', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Diagnostics: this buffer (trouble)' })
vim.keymap.set('n', '<leader>xq', '<Cmd>Trouble qflist toggle<CR>', { desc = 'Quickfix list (trouble)' })
vim.keymap.set('n', '<leader>xr', '<Cmd>Trouble lsp_references toggle<CR>', { desc = 'LSP references (trouble)' })

vim.pack.add { 'https://github.com/stevearc/aerial.nvim' }
require('aerial').setup { layout = { default_direction = 'right' } }
vim.keymap.set('n', '<leader>o', '<Cmd>AerialToggle<CR>', { desc = '[O]utline of symbols' })

vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter-context' }
require('treesitter-context').setup { max_lines = 3 }

-- Names for the prefixes above in the which-key popup
require('which-key').add {
  { '<leader>x', group = 'Diagnostics (trouble)' },
  { '<leader>r', group = '[R]ust' },
}
