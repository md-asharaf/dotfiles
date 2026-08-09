return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        enabled = true,
        win = {
          position = "float",
          border = "rounded",
          width = 0.90,
          height = 0.90,
        },
      },
    },
    keys = {
      {
        "<leader>tt",
        function()
          Snacks.terminal()
        end,
        desc = "Floating Terminal",
      },
      {
        "<leader>tf",
        function()
          Snacks.terminal(nil, {
            win = {
              position = "bottom",
              height = 0.30,
            },
          })
        end,
        desc = "Bottom Terminal",
      },
      {
        "<leader>tv",
        function()
          Snacks.terminal(nil, {
            win = {
              position = "right",
              width = 0.40,
            },
          })
        end,
        desc = "Vertical Terminal",
      },
    },
  },
}
