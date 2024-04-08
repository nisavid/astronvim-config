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
      "comment",
      "diff",
      "ebnf",
      "embedded_template",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "gotmpl",
      "hjson",
      "htmldjango",
      "http",
      "ini",
      "jq",
      "json5",
      "jsonnet",
      "latex",
      "luadoc",
      "mermaid",
      "pem",
      "regex",
      "sql",
      "vim",
      "vimdoc",
    })
  end,
}
