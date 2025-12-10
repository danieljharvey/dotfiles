return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      nixd = {},
      ts_ls = {},
      pyright = {},
      kotlin = {},
      rust_analyzer = {},
    },
  },
}
