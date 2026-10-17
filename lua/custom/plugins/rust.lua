-- Rust: rustaceanvim owns rust-analyzer (it is NOT in the `servers` table in init.lua on purpose)
vim.pack.add { 'https://github.com/mrcjkb/rustaceanvim' }

vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, bufnr)
      local function map(keys, cmd, desc) vim.keymap.set('n', keys, function() vim.cmd.RustLsp(cmd) end, { buffer = bufnr, desc = 'Rust: ' .. desc }) end
      map('K', { 'hover', 'actions' }, 'hover + actions')
      map('<leader>rr', 'runnables', '[r]unnables')
      map('<leader>rt', 'testables', '[t]estables')
      map('<leader>rm', 'expandMacro', 'expand [m]acro')
      map('<leader>re', 'explainError', '[e]xplain error')
      map('<leader>rc', 'openCargo', 'open [C]argo.toml')
      map('<leader>rp', 'parentModule', '[p]arent module')
      map('<leader>rj', 'joinLines', '[j]oin lines')
    end,
    default_settings = {
      ['rust-analyzer'] = {
        check = { command = 'clippy' },
        inlayHints = {
          typeHints = { enable = true },
          parameterHints = { enable = true },
          chainingHints = { enable = true },
        },
      },
    },
  },
}

-- Cargo.toml: crate versions, updates, docs
vim.pack.add { 'https://github.com/saecki/crates.nvim' }
require('crates').setup { lsp = { enabled = true, actions = true, completion = true, hover = true } }

-- Inlay hints (inferred types, parameter names) on by default for any server that supports them.
-- Toggle per buffer with <leader>th (defined in init.lua).
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('custom-inlay-hints', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method('textDocument/inlayHint', event.buf) then vim.lsp.inlay_hint.enable(true, { bufnr = event.buf }) end
  end,
})
