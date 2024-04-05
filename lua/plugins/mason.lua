-- Mason plugins configuration

---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "awk_ls",
        "grammarly",
        "graphql",
        --"jsonld-lsp",
        "lemminx",
        --"ltex",
        --"nginx-language-server",
        "perlnavigator",
        --"pkgbuild_language_server",
        "puppet",
        "sqlls",
        "texlab",
        "vimls",
        "zls",
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "actionlint",
        "codespell",
        "commitlint",
        "editorconfig-checker",
        "vacuum",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts) opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {}) end,
  },
}
