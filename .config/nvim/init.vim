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
}

-- haven't tried this yet but seems fine?
lspconfig.tsserver.setup {}

-- copy pasta from docs
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {},
  },
}
EOF



