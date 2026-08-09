return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
        },
        severity_sort = true,
      },

      inlay_hints = {
        enabled = true,
      },

      servers = {
        lua_ls = {},

        bashls = {},

        dockerls = {},

        docker_compose_language_service = {},

        jsonls = {},

        yamlls = {},

        taplo = {},

        marksman = {},

        html = {},

        cssls = {},

        tailwindcss = {},

        eslint = {},

        prismals = {},
      },
    },
  },
}
