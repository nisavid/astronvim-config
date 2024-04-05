-- AstroCore configuration

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  -- @see `:h astrocore`
  opts = {
    features = {
      -- Global limits for large files for disabling features like treesitter
      large_buf = { size = 1024 * 500, lines = 10000 },
      autopairs = true,
      cmp = true,
      -- Diagnostic mode on start
      -- 0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on
      diagnostics_mode = 3,
      highlighturl = true,
      notifications = true,
    },
    diagnostics = { -- vim.diagnostics.config({...}))
      underline = true,
    },
    options = {
      opt = { -- vim.opt.<key>
        updatetime = 100,

        title = true,

        splitbelow = true,
        splitright = true,
        diffopt = vim.opt.diffopt + "vertical",

        relativenumber = true,

        cursorcolumn = true,
        cursorline = true,

        wrap = true,
        linebreak = true,
        breakindent = true,

        list = true,
        listchars = {
          tab = "󰌒",
          trail = "·",
          nbsp = "␣",
          extends = "…",
          precedes = "…",
        },
      },
      g = {
        firenvim_config = {
          globalSettings = { alt = "all" },
          localSettings = {
            [".*"] = {
              cmdline = "neovim",
              content = "text",
              priority = 0,
              selector = 'textarea:not([readonly], [aria-readonly]), div[role="textbox"]',
              takeover = "never",
            },
          },
        },
      },
    },
    mappings = {
      c = {
        ["<M-h>"] = "<Left>",
        ["<M-j>"] = "<Down>",
        ["<M-k>"] = "<Up>",
        ["<M-l>"] = "<Right>",
      },
      i = {},
      l = {},
      n = {
        ["<C-h>"] = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        ["<C-l>"] = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },

        ["<leader>r"] = { name = "Refactor" },
        ["<leader>r/"] = { name = "Replace all" },
        ["<leader>r/e"] = { ":%s/\\m\\k\\@<!\\V<C-r>=expand('<cexpr>')<cr>\\m\\k\\@!/", desc = "C expression" },
        ["<leader>r/f"] = { ":%s/\\m\\f\\@<!\\V<C-r>=expand('<cfile>')<cr>\\m\\f\\@!/", desc = "path name" },
        ["<leader>r/w"] = { ":%s/\\m\\k\\@<!\\V<C-r>=expand('<cword>')<cr>\\m\\k\\@!/", desc = "word" },
        ["<leader>r/W"] = { ":%s/\\m\\k\\@<!\\V<C-r>=expand('<cWORD>')<cr>\\m\\k\\@!/", desc = "WORD" },
      },
      o = {
        ["a="] = { name = "assignment" },
        ["i="] = { name = "assignment" },
      },
      s = {},
      t = {},
      v = {},
      x = {
        ["<leader>r"] = { name = "Refactor" },
        ["<leader>r/"] = { name = "Replace all" },
        ["<leader>r//"] = { '"sy:%s/\\V<C-r>s/', desc = "Replace all" },
        ["<leader>r/w"] = { '"sy:%s/\\m\\k\\@<!\\V<C-r>s\\m\\k\\@!/', desc = "Replace all (keyword match)" },
      },
    },
    autocmds = {
      -- Disable `alpha_autostart` due to incompatibility
      -- with `restore_session` (below)
      --alpha_autostart = false,
      cursorlines_only_in_curr_win = {
        {
          desc = "Enable cursorcolumn/cursorline in current window",
          event = "WinEnter",
          callback = function()
            vim.opt_local.cursorcolumn = true
            vim.opt_local.cursorline = true
          end,
        },
        {
          desc = "Disable cursorcolumn/cursorline in non-current window",
          event = "WinLeave",
          callback = function()
            vim.opt_local.cursorcolumn = false
            vim.opt_local.cursorline = false
          end,
        },
      },
      --restore_session = {
      --  {
      --    desc = "Restore previous directory session if Neovim is started with no arguments",
      --    event = "VimEnter",
      --    callback = function()
      --      if vim.fn.argc(-1) == 0 then
      --        require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
      --        vim.tbl_map(vim.cmd.doautoall, { "BufReadPre", "BufReadPost" })
      --      end
      --    end,
      --  },
      --},
      update_breakindent = {
        {
          desc = "Update breakindent to match effective shiftwidth",
          event = "OptionSet",
          pattern = { "shiftwidth", "tabstop" },
          callback = function() vim.opt_local.breakindentopt = { shift = vim.fn.shiftwidth() } end,
        },
      },
    },
  },
}
