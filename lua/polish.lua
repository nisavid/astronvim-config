-- Final setup

local cmd_abbrevs = {
  h = "vert h",
  help = "vertical help",
}
for lhs, rhs in pairs(cmd_abbrevs) do
  vim.cmd.cnoreabbrev(
    "<expr>",
    lhs,
    "getcmdtype() == ':' && getcmdline() ==# '" .. lhs .. "' ? '" .. rhs .. "' : '" .. lhs .. "'"
  )
end
