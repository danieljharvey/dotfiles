return {
  -- Override rustaceanvim configuration to ensure it uses Nix-provided rust-analyzer
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        cmd = { "rust-analyzer" }, -- Use rust-analyzer from PATH (Nix-provided)
        default_settings = {
          ["rust-analyzer"] = {
            rustc = {
              source = "discover",
            },
            cargo = {
              allFeatures = true,
              buildScripts = {
                enable = true,
              },
              loadOutDirsFromCheck = true,
            },
            procMacro = {
              enable = true,
            },
            checkOnSave = true,
            files = {
              exclude = { ".direnv", ".git", ".jj", ".github", ".gitlab", "bin", "node_modules", "target", "venv", ".venv" },
              watcher = "client"
            },
          },
        },
      },
    },
  },
}
