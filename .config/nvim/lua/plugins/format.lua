return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["markdown"] = { "prettier" },
      ["json"] = { "prettier" },
      ["kotlin"] = { "ktlint" },
    },
  },
}
