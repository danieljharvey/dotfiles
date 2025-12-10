return {
  -- Configure mason-lspconfig to not auto-install rust-analyzer
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- Disable automatic installation for rust-analyzer since we use Nix
      automatic_installation = {
        exclude = { "rust_analyzer" },
      },
    },
  },
  -- Disable Mason's rust-analyzer installation
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  -- Configure rust-analyzer to use Nix toolchain
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
  },
}
