return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          installCargo = false,
          installRustc = false,
          cmd = { "rust-analyzer" },
          settings = {
            ["rust-analyzer"] = {
              -- Let rust-analyzer auto-detect the toolchain from your Nix environment
              rustc = {
                source = "discover",
              },
              procMacro = {
                enable = true,
                -- Don't override the proc-macro server path
                server = nil,
              },
              cargo = {
                buildScripts = {
                  enable = true,
                },
              },
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      },
    },
  },
}
