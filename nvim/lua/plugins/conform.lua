return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },

      formatters_by_ft = {
        lua = { "stylua" },

        javascript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },

        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },

        json = { "prettierd", "prettier" },
        jsonc = { "prettierd", "prettier" },

        yaml = { "prettierd", "prettier" },

        markdown = { "prettierd", "prettier" },

        html = { "prettierd", "prettier" },

        css = { "prettierd", "prettier" },

        scss = { "prettierd", "prettier" },

        prisma = { "prisma_fmt" },

        go = { "gofumpt", "goimports" },

        java = { "google-java-format" },

        sh = { "shfmt" },
      },
    },
  },
}
