-- Start screen (mini.starter, part of mini.nvim which is already installed)
local starter = require 'mini.starter'

-- Recently used directories, derived from `:oldfiles`. Selecting one cd's into it and opens a file picker.
local function recent_dirs(n)
  return function()
    local seen, items = {}, {}
    for _, file in ipairs(vim.v.oldfiles) do
      local dir = vim.fs.dirname(file)
      if not seen[dir] and vim.fn.isdirectory(dir) == 1 then
        seen[dir] = true
        table.insert(items, {
          name = vim.fn.fnamemodify(dir, ':~'),
          action = ('cd %s | Telescope find_files'):format(vim.fn.fnameescape(dir)),
          section = 'Recent directories',
        })
        if #items >= n then break end
      end
    end
    return items
  end
end

starter.setup {
  evaluate_single = true,
  items = {
    { name = 'Find file', action = 'Telescope find_files', section = 'Actions' },
    { name = 'Grep text', action = 'Telescope live_grep', section = 'Actions' },
    { name = 'Browse folders', action = 'edit .', section = 'Actions' },
    { name = 'Recent files (all)', action = 'Telescope oldfiles', section = 'Actions' },
    { name = 'New file', action = 'enew', section = 'Actions' },
    { name = 'Quit', action = 'qa', section = 'Actions' },
    starter.sections.recent_files(8, false, false),
    recent_dirs(6),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.aligning('center', 'center'),
  },
}
