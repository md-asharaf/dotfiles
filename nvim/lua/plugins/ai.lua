return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
      },
      display = {
        chat = {
          window = {
            layout = "vertical",
            width = 0.35,
          },
        },
      },
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "AI Actions" },
      { "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "AI Chat" },
      { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "AI Inline" },
    },
  },
}
