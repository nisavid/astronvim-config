-- AstroLSP configuration

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  -- @see `:h astrolsp`
  opts = {
    features = {
      autoformat = true,
      codelens = true,
      inlay_hints = true,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 5000,
    },
    -- Servers installed without mason
    servers = {},
    ---@diagnostic disable: missing-fields
    config = {
      bashls = {
        init_options = { bashIde = { shellcheckPath = "" } },
        on_attach = function(client, bufnr)
          for other_client in vim.iter(vim.lsp.get_clients { bufnr = bufnr }) do
            if other_client.name == "pkgbuild_language_server" then
              vim.lsp.buf_detach_client(bufnr, client.id)
              break
            end
          end
        end,
      },
      cssls = {
        capabilities = (function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true
          return capabilities
        end)(),
      },
      pkgbuild_language_server = {
        filetypes = { "bash" },
        root_dir = require("lspconfig.util").root_pattern "PKGBUILD",
        on_attach = function(_, bufnr)
          for other_client in vim.iter(vim.lsp.get_clients { bufnr = bufnr }) do
            if other_client.name == "bashls" then vim.lsp.buf_detach_client(bufnr, other_client.id) end
          end
        end,
      },
      taplo = {
        -- Add `.*.toml` to root patterns in order to work around <https://github.com/tamasfe/taplo/issues/439>
        root_dir = require("lspconfig.util").root_pattern("*.toml", ".*.toml", ".git"),
      },
      tsserver = {
        settings = {
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        },
      },
    },
    handlers = {},
    autocmds = {},
    mappings = {},
    --on_attach = function(client, bufnr)
    --end,
  },
}
