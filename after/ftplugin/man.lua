vim.keymap.set(
  "n",
  "gO",
  vim.tbl_filter(function(map) return map.lhs == "gO" end, vim.api.nvim_buf_get_keymap(0, "n"))[1].rhs .. "<C-w>L",
  { buffer = true, desc = "View outline" }
)
