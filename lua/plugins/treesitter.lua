-- Tree-sitter parsers configuration

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local mappings = opts.mappings
        local prefix = "<Leader>pt"
        mappings.n[prefix] = { desc = "Tree-sitter" }
        mappings.n[prefix .. "s"] = {
          vim.cmd.TSInstallInfo,
          desc = "Language module status",
        }
        mappings.n[prefix .. "S"] = {
          vim.cmd.TSModuleInfo,
          desc = "Language module features",
        }
        mappings.n[prefix .. "u"] = {
          vim.cmd.TSModuleInfo,
          desc = "Update all modules",
        }
      end,
    },
  },
  opts = function(_, opts)
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "bash",
      "comment",
      "css",
      "diff",
      "ebnf",
      "embedded_template",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "hjson",
      "html",
      "htmldjango",
      "http",
      "ini",
      "javascript",
      "jq",
      "json",
      "json5",
      "jsonc",
      "jsonnet",
      "latex",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "mermaid",
      "pem",
      "regex",
      "sql",
      "vim",
      "vimdoc",
    })
  end,
}
