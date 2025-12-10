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
      rust_analyzer = {
        -- Use whatever rust-analyzer is in PATH (provided by Nix)
        cmd = { "rust-analyzer" },
        settings = {
          ["rust-analyzer"] = {
            -- Use Nix-provided Rust toolchain
            rustc = {
              source = "discover",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    },
  },
}
