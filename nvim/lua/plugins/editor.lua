return {
  -- Better notifications
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        signature = {
          enabled = false,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },

  -- Better diagnostics
  {
    "folke/trouble.nvim",
    opts = {
      use_diagnostic_signs = true,
      auto_close = true,
      auto_preview = false,
      focus = true,
    },
  },

  -- Todo comments
  {
    "folke/todo-comments.nvim",
    opts = {},
  },

  -- Flash (better navigation)
  {
    "folke/flash.nvim",
    opts = {},
  },

  -- Snacks
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
      },
      notifier = {
        enabled = true,
      },
      terminal = {
        enabled = true,
      },
      picker = {
        enabled = true,
      },
    },
  },

  -- Better file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = "open_default",
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        width = 34,
      },
    },
  },
}
