-- GUI configuration

--vim.g.GuiName = vim.tbl_map(
--  function(chan) return vim.api.nvim_get_chan_info(chan).client.name end,
--  vim.tbl_map(function(ui) return ui.chan end, vim.tbl_filter(function(ui) return ui.rgb end, vim.api.nvim_list_uis()))
--)[1]

vim.opt.guifont = "OperatorMonoSSmLig NF Light:h10:w26"

vim.keymap.set({ "n", "x" }, "<C-S-v>", '"+gP')
vim.keymap.set("i", "<C-S-v>", "<C-R>+")
vim.keymap.set("x", "<C-S-c>", '"+ygv')

if vim.fn.GuiName() == "nvim-qt" then
  if vim.fn.exists "g:GuiLoaded" == 1 then
    vim.cmd.GuiTabline(1)
    vim.cmd.GuiPopupmenu(1)
    vim.cmd.GuiScrollBar(1)

    vim.cmd.GuiRenderLigatures(1)

    -- FIXME: expected valid type, got Float
    --vim.cmd.GuiWindowOpacity(0.85)
    vim.cmd "GuiWindowOpacity 0.85"

    if vim.fn.exists "g:GuiClipboard" == 1 then vim.fn.GuiClipboard() end

    vim.keymap.set({ "n", "x" }, "<RightMouse>", vim.fn.GuiShowContextMenu, { silent = true })
    vim.keymap.set("i", "<RightMouse>", function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
      vim.fn.GuiShowContextMenu()
    end, { silent = true })
    vim.keymap.set("s", "<RightMouse>", function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-g>", true, false, true), "i", false)
      vim.fn.GuiShowContextMenu()
    end, { silent = true })
  end
end
