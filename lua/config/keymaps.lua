-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Close current buffer without closing Neovim
vim.keymap.set("n", "<C-q>", function()
  Snacks.bufdelete()
end, { desc = "Close buffer" })

-- WSL: open URL under cursor with Windows browser
vim.keymap.set({ "n", "t" }, "gx", function()
  local url
  if vim.bo.buftype == "terminal" then
    -- In terminal buffer, grab the word/URL at cursor position
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2] + 1
    url = line:match("https?://[%w%.%-%+%%/?=&#_~:@!$&'%(%)%*%+,;]+") or line:sub(col):match("^[%S]+")
  else
    url = vim.fn.expand("<cfile>")
  end
  if url and url ~= "" then
    vim.fn.jobstart({ "powershell.exe", "start", url }, { detach = true })
  end
end, { desc = "Open URL in browser" })
