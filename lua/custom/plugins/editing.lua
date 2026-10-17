-- Small editing helpers. Commenting is built in: `gcc` (line), `gc` in visual mode.

-- Jump to any visible match: `s`, type 1-2 characters, press the label shown
vim.pack.add { 'https://github.com/folke/flash.nvim' }
require('flash').setup { modes = { char = { enabled = false } } } -- leave f/t/;/, alone
vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash: jump to match' })

-- Underline other uses of the word under the cursor
require('mini.cursorword').setup()

-- Highlight trailing whitespace; `:TrimWhitespace` removes it
require('mini.trailspace').setup()
vim.api.nvim_create_user_command('TrimWhitespace', function()
  MiniTrailspace.trim()
  MiniTrailspace.trim_last_lines()
end, { desc = 'Trim trailing whitespace and trailing blank lines' })

-- Move lines/selections with Alt+h/j/k/l (mini.move defaults)
require('mini.move').setup()
