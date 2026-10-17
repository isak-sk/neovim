# Neovim setup

Leader is `<Space>`. Press it and wait: which-key shows what comes next. `C-x` = Ctrl+x, `A-x` = Alt+x.

## Top 10 keys to learn first
1. `<leader>sf` find a file, `<leader>sg` search text in the project
2. `<leader><leader>` switch between open files
3. `\` file tree
4. `grd` go to definition, `C-o` to jump back
5. `K` hover docs and type
6. `s` + 1-2 letters + label: jump anywhere on screen
7. `gra` code action (fixes, imports), `grn` rename
8. `<leader>w` save, `<leader>q` quit
9. `gcc` comment a line (`gc` on a selection)
10. `<leader>xx` list all errors

## Find and open
- **telescope**: fuzzy finder. `<leader>sf` files, `sg` grep, `sw` word under cursor, `s.` recent, `<leader>/` search this file, `sr` resume, `sk` search keymaps.
- **neo-tree**: file sidebar. `\` toggles, `?` inside shows its keys.
- **mini.starter**: start screen. Press the shown letter or `Enter`.

## Code intelligence
- **LSP (lspconfig + mason)**: `grd` definition, `grr` references, `gri` implementations, `grt` type definition, `K` hover, `grn` rename, `gra` code action, `gO` file symbols, `[d` `]d` next/previous problem. `:Mason` manages servers.
- **inlay hints**: grey inferred types inline. `<leader>th` toggles.
- **blink.cmp + LuaSnip**: autocomplete. `C-n`/`C-p` choose, `C-y` accept, `C-e` dismiss, `Tab` next snippet field.
- **conform**: `<leader>f` formats.
- **treesitter / treesitter-context**: syntax and structure; the current function header stays pinned on top.
- **aerial**: `<leader>o` symbol outline.
- **trouble**: `<leader>xx` all problems, `xX` this file, `xq` quickfix, `xr` references.
- **todo-comments**: highlights TODO/FIXME. `:TodoTelescope` lists them.
- **fidget**: loading progress in the corner.

## Rust
- **rustaceanvim**: `<leader>rr` run, `rt` tests, `rm` expand macro, `re` explain error, `rc` Cargo.toml, `rp` parent module. `K` shows hover plus actions.
- **crates.nvim**: crate versions inline in `Cargo.toml`.

## Git
- **gitsigns**: gutter markers. `]c` `[c` next/previous change, `<leader>hs` stage hunk, `hr` reset, `hp` preview, `hb` blame, `hd` diff.

## Editing
- **flash**: `s`, type 1-2 characters, press the label.
- **mini.move**: `A-h/j/k/l` moves the line or selection.
- **mini.surround**: `gsa` add (`gsaiw"`), `gsd` delete (`gsd"`), `gsr` replace (`gsr"'`).
- **mini.ai**: more text objects: `ci"`, `da(`, `if` function call, `ia` argument.
- **mini.cursorword**: underlines other uses of the word under the cursor.
- **mini.trailspace**: highlights trailing spaces. `:TrimWhitespace` removes them.
- **nvim-autopairs**: closes brackets and quotes. **guess-indent**: detects tabs vs spaces.

## Looks
tokyonight (colors), mini.statusline (bottom bar), mini.icons (file icons), smear-cursor (cursor trail), which-key (key hints).

## Housekeeping
- Update plugins: `:lua vim.pack.update()`. Versions are pinned in `nvim-pack-lock.json`.
- Your plugin files: `lua/custom/plugins/` (`editing.lua`, `code-nav.lua`, `rust.lua`, `starter.lua`, `smear-cursor.lua`); they load automatically. Core config: `init.lua`.
- Problems: `:checkhealth`.
