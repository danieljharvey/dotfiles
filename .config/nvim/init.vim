set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua <<EOF

-- look! we're writing lua like it's PHP

-- all importing of Plugins still lives in .vimrc because I fear change

-- Setup lspconfig
local lspconfig = require('lspconfig')

-- here we do Haskell
lspconfig.hls.setup{
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
  rootPatterns = { "*.cabal", "cabal.project", "hie.yaml" },
  settings = {
    haskell = {
      formattingProvider = "ormolu",
      checkParents = "CheckOnSave",
      checkProject = true
    },
    plugin = {
      hlint = { globalOn = true }
    }
  }
}

-- haven't tried this yet but seems fine?
lspconfig.tsserver.setup {}

-- copy pasta from docs
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {},
  },
}

-- Create an event handler for the FileType autocommand
vim.api.nvim_create_autocmd('FileType', {
  -- This handler will fire when the buffer's 'filetype' is "python"
  pattern = 'calc',
  callback = function(args)
    vim.lsp.start({
      name = 'calc-lsp',
      cmd = {'wasm-calc11', 'lsp'},
      -- Set the "root directory" to the parent directory of the file in the
      -- current buffer (`args.buf`) that contains either a "setup.py" or a
      -- "pyproject.toml" file. Files that share a root directory will reuse
      -- the connection to the same LSP server.
      root_dir = vim.fs.root(args.buf, {'calc-project.json'}),
    })
  end,
})

-- Create an event handler for the FileType autocommand
vim.api.nvim_create_autocmd('FileType', {
  -- This handler will fire when the buffer's 'filetype' is "python"
  pattern = 'frame',
  callback = function(args)
    vim.lsp.start({
      name = 'frame-lsp',
      cmd = {'frame-lsp'},
      -- Set the "root directory" to the parent directory of the file in the
      -- current buffer (`args.buf`) that contains either a "setup.py" or a
      -- "pyproject.toml" file. Files that share a root directory will reuse
      -- the connection to the same LSP server.
      root_dir = vim.fs.root(args.buf, {'frame-project.json' }),
    })
  end,
})

if os.getenv("SMOL_LANGUAGE_SERVER_PATH") then
  vim.lsp.start({
    name = 'mimsa',
    cmd = {os.getenv("SMOL_LANGUAGE_SERVER_PATH")},
    root_dir = vim.fs.dirname(vim.fs.find({'smol-project.json'}, { upward = true })[1]),
  })
end

-- BEGIN copy pasta from https://github.com/neovim/nvim-lspconfig

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- END copy pasta from https://github.com/neovim/nvim-lspconfig

-- set up Hasura file highlighting

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.hml",
  command = "set filetype=yaml",
})


EOF



