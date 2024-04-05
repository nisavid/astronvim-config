-- AstroCommunity plugins configuration

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  -- Neovim >= 0.10
  --{ import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  --{
  --  "Bekaboo/dropbar.nvim",
  --  opts = {
  --    general = {
  --      enable = function(buf, win)
  --        -- Disable for confini.  For some reason, dropbar uses only Neovim's built-in tree-sitter integration
  --        -- (not nvim-treesitter), which fails to map filetype confini to tree-sitter language ini.  This causes
  --        -- a flood of errors when editing confini files.
  --        return not vim.api.nvim_win_get_config(win).zindex
  --          and vim.bo[buf].buftype == ""
  --          and vim.api.nvim_buf_get_name(buf) ~= ""
  --          and not vim.wo[win].diff
  --          and vim.o.filetype ~= "confini"
  --      end,
  --    },
  --  },
  --},
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.bars-and-lines.statuscol-nvim" },
  { import = "astrocommunity.code-runner.compiler-nvim" },
  { import = "astrocommunity.code-runner.overseer-nvim" },
  { import = "astrocommunity.color.headlines-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.debugging.nvim-bqf" },
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  {
    "folke/trouble.nvim",
    branch = "dev",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local mappings = opts.mappings
          local prefix = "<Leader>x"
          mappings.n[prefix] = {
            desc = require("astroui").get_icon("Trouble", 1, true) .. "Trouble",
          }
          mappings.n[prefix .. "x"] = {
            "<Cmd>Trouble diagnostics toggle<CR>",
            desc = "Diagnostics",
          }
          mappings.n[prefix .. "X"] = {
            "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>",
            desc = "Buffer Diagnostics",
          }
          mappings.n[prefix .. "l"] = {
            "<Cmd>Trouble loclist toggle<CR>",
            desc = "Location List",
          }
          mappings.n[prefix .. "q"] = {
            "<Cmd>Trouble qflist toggle<CR>",
            desc = "Quickfix List",
          }
          mappings.n[prefix .. "cl"] = {
            "<Cmd>Trouble symbols toggle focus=false<CR>",
            desc = "Symbols",
          }
          mappings.n[prefix .. "cl"] = {
            "<Cmd>Trouble lsp toggle focus=false win.position=right<CR>",
            desc = "LSP Definitions / references / ...",
          }
        end,
      },
    },
    opts = {
      auto_open = true,
      auto_close = true,
    },
  },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.nvim-devdocs" },
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.editing-support.suda-vim" },
  { import = "astrocommunity.editing-support.stickybuf-nvim" },
  { import = "astrocommunity.editing-support.treesj" },
  --{ import = "astrocommunity.editing-support.telescope-undo-nvim" },
  --{ "debugloop/telescope-undo.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "debugloop/telescope-undo.nvim" },
    keys = {
      {
        "<Leader>fu",
        function() require("telescope").extensions.undo.undo() end,
        desc = "Find undos",
      },
    },
    opts = function(opts)
      local telescope_undo = require "telescope-undo.actions"
      return require("astrocore").extend_tbl(opts, {
        extensions = {
          undo = {
            mappings = {
              i = {
                ["<C-y>"] = telescope_undo.yank_additions,
                ["<C-z>"] = telescope_undo.yank_deletions,
                ["<CR>"] = telescope_undo.restore,
              },
            },
          },
        },
      })
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension "undo"
    end,
  },
  -- TODO: After <https://github.com/AstroNvim/astrocommunity/issues/830> is resolved
  --{ import = "astrocommunity.editing-support.yanky-nvim" },
  --{
  --  "gbprod/yanky.nvim",
  --  opts = { ring = { history_length = 100 } },
  --},
  --{
  --  "nvim-telescope/telescope.nvim",
  --  keys = {
  --    { "<Leader>fy", function() require("telescope").extensions.yank_history.yank_history() end, desc = "Find yanks" },
  --  },
  --  opts = { extensions = { yank_history = { dynamic_preview_title = true } } },
  --},
  {
    "gbprod/yanky.nvim",
    dependencies = {
      { "kkharji/sqlite.lua", enabled = not jit.os:find "Windows" },
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>fy"] = { "<Cmd>Telescope yank_history<CR>", desc = "Open Yank History" },
              ["y"] = { "<Plug>(YankyYank)", desc = "Yank text" },
              ["p"] = { "<Plug>(YankyPutAfter)", desc = "Put yanked text after cursor" },
              ["P"] = { "<Plug>(YankyPutBefore)", desc = "Put yanked text before cursor" },
              ["gp"] = { "<Plug>(YankyGPutAfter)", desc = "Put yanked text after selection" },
              ["gP"] = { "<Plug>(YankyGPutBefore)", desc = "Put yanked text before selection" },
              ["[y"] = { "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
              ["]y"] = { "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
              ["]p"] = { "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
              ["[p"] = { "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
              ["]P"] = { "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
              ["[P"] = { "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
              [">p"] = { "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
              ["<p"] = { "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
              [">P"] = { "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
              ["<P"] = { "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
              ["=p"] = { "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
              ["=P"] = { "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
            },
            x = {
              ["y"] = { "<Plug>(YankyYank)", desc = "Yank text" },
              ["p"] = { "<Plug>(YankyPutAfter)", desc = "Put yanked text after cursor" },
              ["P"] = { "<Plug>(YankyPutBefore)", desc = "Put yanked text before cursor" },
              ["gp"] = { "<Plug>(YankyGPutAfter)", desc = "Put yanked text after selection" },
              ["gP"] = { "<Plug>(YankyGPutBefore)", desc = "Put yanked text before selection" },
            },
          },
        },
      },
    },
    opts = function()
      local mapping = require "yanky.telescope.mapping"
      local mappings = mapping.get_defaults()
      mappings.i["<c-p>"] = nil
      return {
        highlight = { timer = 200 },
        ring = { storage = jit.os:find "Windows" and "shada" or "sqlite" },
        picker = {
          telescope = {
            use_default_mappings = false,
            mappings = mappings,
          },
        },
      }
    end,
  },
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.octo-nvim" },
  { import = "astrocommunity.git.openingh-nvim" },
  { import = "astrocommunity.indent.indent-tools-nvim" },
  { import = "astrocommunity.lsp.garbage-day-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  --{ import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.motion.flit-nvim" },
  { import = "astrocommunity.motion.grapple-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.nvim-spider" },
  { import = "astrocommunity.motion.portal-nvim" },
  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.pack.angular" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.elm" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.full-dadbod" },
  --{ import = "astrocommunity.pack.haskell" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.ps1" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.programming-language-support.csv-vim" },
  { import = "astrocommunity.programming-language-support.dooku-nvim" },
  { import = "astrocommunity.programming-language-support.web-tools-nvim" },
  { import = "astrocommunity.project.nvim-spectre" },
  { import = "astrocommunity.project.projectmgr-nvim" },
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.search.sad-nvim" },
  --{ import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { "karb94/neoscroll.nvim", enabled = vim.fn.exists "g:goneovim" == 0 },
  -- Neovim < 0.10
  { import = "astrocommunity.scrolling.nvim-scrollbar" },
  -- Neovim >= 0.10
  --{ import = "astrocommunity.scrolling.satellite-nvim" },
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.test.nvim-coverage" },
  { import = "astrocommunity.utility.noice-nvim" },
}
