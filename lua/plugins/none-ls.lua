-- None-ls sources configuration

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"
    opts.sources = {
      null_ls.builtins.diagnostics.checkmake,
      null_ls.builtins.diagnostics.dotenv_linter,
      null_ls.builtins.diagnostics.fish,
      null_ls.builtins.diagnostics.qmllint,
      null_ls.builtins.diagnostics.rpmspec,
      null_ls.builtins.diagnostics.rstcheck,
      null_ls.builtins.diagnostics.zsh,
      null_ls.builtins.formatting.fish_indent,
      null_ls.builtins.formatting.nginx_beautifier,
      null_ls.builtins.formatting.pg_format,
      null_ls.builtins.formatting.qmlformat,
      null_ls.builtins.formatting.shellharden,
      --null_ls.builtins.formatting.xmllint,
    }
    return opts
  end,
}
