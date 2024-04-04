-- AstroNvim bundled plugins configuration

return {
  { "max397574/better-escape.nvim", enabled = false },
  { "numToStr/Comment.nvim", opts = { padding = false } },
  {
    "stevearc/dressing.nvim",
    opts = {
      select = {
        get_config = function(opts)
          if opts.kind == "legendary.nvim" then
            return {
              telescope = {
                sorter = require("telescope.sorters").fuzzy_with_index_bias {},
              },
            }
          else
            return {}
          end
        end,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = vim.fn.executable "tree-sitter" ~= 0,
      textobjects = {
        select = {
          keymaps = {
            ["a/"] = { query = "@comment.outer", desc = "around comment" },
            ["i/"] = { query = "@comment.inner", desc = "inside comment" },
            ["ah"] = { query = "@statement.outer", desc = "around statement" },
            ["al"] = { query = "@class.outer", desc = "around class" },
            ["il"] = { query = "@class.inner", desc = "inside class" },
            ["a%"] = { query = "@loop.outer", desc = "around loop" },
            ["i%"] = { query = "@loop.inner", desc = "inside loop" },
            ["a_"] = { query = "@return.outer", desc = "around return" },
            ["i_"] = { query = "@return.inner", desc = "inside return" },
            ["a=e"] = { query = "@assignment.outer", desc = "around assignment" },
            ["i=e"] = { query = "@assignment.inner", desc = "inside assignment" },
            ["a=<"] = { query = "@assignment.lhs", desc = "left side of assignment" },
            ["i=<"] = { query = "@assignment.lhs", desc = "left side of assignment" },
            ["a=>"] = { query = "@assignment.rhs", desc = "right side of assignment" },
            ["i=>"] = { query = "@assignment.rhs", desc = "right side of assignment" },
            ["ar"] = { query = "@attribute.outer", desc = "around attribute" },
            ["ir"] = { query = "@attribute.inner", desc = "inside attribute" },
            ["a&"] = { query = "@call.outer", desc = "around call" },
            ["i&"] = { query = "@call.inner", desc = "inside call" },
            ["a*"] = { query = "@regex.outer", desc = "around regex" },
            ["i*"] = { query = "@regex.inner", desc = "inside regex" },
            ["i#"] = { query = "@number.inner", desc = "number" },
          },
        },
        move = {
          goto_next_start = {
            ["]h"] = { query = "@statement.outer", desc = "Next statement start" },
            ["]l"] = { query = "@class.outer", desc = "Next class start" },
            ["]r"] = { query = "@attribute.outer", desc = "Next attribute start" },
          },
          goto_next_end = {
            ["]H"] = { query = "@statement.outer", desc = "Next statement end" },
            ["]L"] = { query = "@class.outer", desc = "Next class end" },
            ["]R"] = { query = "@attribute.outer", desc = "Next attribute end" },
          },
          goto_previous_start = {
            ["[h"] = { query = "@statement.outer", desc = "Previous statement start" },
            ["[l"] = { query = "@class.outer", desc = "Previous class start" },
            ["[r"] = { query = "@attribute.outer", desc = "Previous attribute start" },
          },
          goto_previous_end = {
            ["[H"] = { query = "@statement.outer", desc = "Previous statement end" },
            ["[L"] = { query = "@class.outer", desc = "Previous class end" },
            ["[R"] = { query = "@attribute.outer", desc = "Previous attribute end" },
          },
        },
        swap = {
          swap_next = {
            [">H"] = { query = "@statement.outer", desc = "Swap next statement" },
            [">L"] = { query = "@class.outer", desc = "Swap next class" },
            [">R"] = { query = "@attribute.outer", desc = "Swap next attribute" },
          },
          swap_previous = {
            ["<H"] = { query = "@statement.outer", desc = "Swap previous statement" },
            ["<L"] = { query = "@class.outer", desc = "Swap previous class" },
            ["<R"] = { query = "@attribute.outer", desc = "Swap previous attribute" },
          },
        },
      },
    },
  },
}
