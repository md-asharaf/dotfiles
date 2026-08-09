return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      opts.servers.vtsls = {
        settings = {
          typescript = {
            updateImportsOnFileMove = {
              enabled = "always",
            },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = true },
            },
          },
          javascript = {
            updateImportsOnFileMove = {
              enabled = "always",
            },
            suggest = {
              completeFunctionCalls = true,
            },
          },
          vtsls = {
            autoUseWorkspaceTsdk = true,
          },
        },
      }

      return opts
    end,
  },
}
