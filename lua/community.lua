-- AstroCommunity plugins configuration

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.bars-and-lines.statuscol-nvim" },
  { import = "astrocommunity.code-runner.compiler-nvim" },
  { import = "astrocommunity.code-runner.overseer-nvim" },
  { import = "astrocommunity.color.headlines-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.completion.avante-nvim" },
  -- Consider switching from nvim-cmp to blink.cmp someday in the future
  -- when blink.cmp is more mature.
  --{ import = "astrocommunity.completion.blink-cmp" },
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.completion.cmp-git" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        auto_trigger = true,
        debounce = 150,
        keymap = {
          accept = "<C-l>",
          accept_word = "<M-l>",
          accept_line = "<M-j>",
        },
      },
    },
  },
  { import = "astrocommunity.completion.magazine-nvim" },
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
  { import = "astrocommunity.diagnostics.error-lens-nvim" },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  {
    "folke/trouble.nvim",
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
      modes = {
        diagnostics = {
          auto_open = true,
          auto_close = true,
        },
      },
    },
  },
  { import = "astrocommunity.docker.lazydocker" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.editing-support.conform-nvim" },
  { import = "astrocommunity.editing-support.copilotchat-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.nvim-context-vt" },
  { import = "astrocommunity.editing-support.nvim-devdocs" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
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
  --{ import = "astrocommunity.editing-support.vim-doge" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  {
    "gbprod/yanky.nvim",
    opts = { ring = { history_length = 100 } },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = { extensions = { yank_history = { dynamic_preview_title = true } } },
  },
  { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.fugit2-nvim" },
  { import = "astrocommunity.git.gitlinker-nvim" },
  { import = "astrocommunity.git.gitgraph-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.octo-nvim" },
  { import = "astrocommunity.git.openingh-nvim" },
  { import = "astrocommunity.indent.indent-tools-nvim" },
  { import = "astrocommunity.lsp.actions-preview-nvim" },
  { import = "astrocommunity.lsp.delimited-nvim" },
  { import = "astrocommunity.lsp.garbage-day-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.lsp.lsplinks-nvim" },
  --{ import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
  --{ import = "astrocommunity.markdown-and-latex.glow-nvim" },
  --{
  --  "ellisonleao/glow.nvim",
  --  keys = { { "<M-F5>", ":Glow<CR>", desc = "Render markdown (floating)" } },
  --  opts = function(_, opts)
  --    opts.width = vim.o.columns
  --    opts.height = vim.o.lines
  --    opts.width_ratio = 0.62
  --    opts.height_ratio = 0.76
  --    local style = os.getenv "GLAMOUR_STYLE"
  --    if style and vim.uv.fs_access(style, "R") then opts.style = style end
  --    return opts
  --  end,
  --},
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  {
    "iamcco/markdown-preview.nvim",
    keys = {
      {
        "<F5>",
        "<Plug>MarkdownPreviewToggle",
        desc = "Render markdown (web browser)",
      },
    },
  },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  { import = "astrocommunity.media.codesnap-nvim" },
  { import = "astrocommunity.media.img-clip-nvim" },
  { import = "astrocommunity.motion.before-nvim" },
  { import = "astrocommunity.motion.flit-nvim" },
  { import = "astrocommunity.motion.grapple-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.nvim-spider" },
  { import = "astrocommunity.motion.portal-nvim" },
  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.neovim-lua-development.helpview-nvim" },
  { import = "astrocommunity.note-taking.venn-nvim" },
  { import = "astrocommunity.pack.angular" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.chezmoi" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.elm" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.full-dadbod" },
  -- Consider adding harper in the future.  For now, it's not included
  -- because it produces extremely noisy false positives in commented-out
  -- source code (e.g. in this file).
  --{ import = "astrocommunity.pack.harper" },
  -- AstroCommunity's config specifies `harper-ls` even though mason-lspconfig
  -- only recognizes `harper_ls`.
  --{
  --  "williamboman/mason-lspconfig.nvim",
  --  opts = function(_, opts)
  --    opts.ensure_installed = require("astrocore").list_insert_unique(
  --      vim.tbl_filter(function(item) return item ~= "harper-ls" end, opts.ensure_installed),
  --      { "harper_ls" }
  --    )
  --  end,
  --},
  { import = "astrocommunity.pack.haskell" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.hyprlang" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.mdx" },
  { import = "astrocommunity.pack.ps1" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },
  { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.templ" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.programming-language-support.csv-vim" },
  { import = "astrocommunity.programming-language-support.nvim-jqx" },
  { import = "astrocommunity.programming-language-support.rest-nvim" },
  { import = "astrocommunity.programming-language-support.dooku-nvim" },
  { import = "astrocommunity.programming-language-support.web-tools-nvim" },
  { import = "astrocommunity.project.projectmgr-nvim" },
  { import = "astrocommunity.quickfix.nvim-bqf" },
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.remote-development.remote-sshfs-nvim" },
  { import = "astrocommunity.search.nvim-spectre" },
  { import = "astrocommunity.search.sad-nvim" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { "karb94/neoscroll.nvim", enabled = vim.fn.exists "g:goneovim" == 0 },
  { import = "astrocommunity.scrolling.satellite-nvim" },
  -- Removed for now as the glyphs are in some cases hard to distinguish
  -- from each other (especially in plain-text files).
  --
  -- TODO: Fix this with an alternative configuration or plugin.
  --
  --{ import = "astrocommunity.split-and-window.neominimap-nvim" },
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.test.nvim-coverage" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.utility.vim-fetch" },
}
