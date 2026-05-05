-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_php_lsp = "intelephense"

-- WSL clipboard via win32yank
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = { "win32yank.exe", "-i", "--crlf" },
      ["*"] = { "win32yank.exe", "-i", "--crlf" },
    },
    paste = {
      ["+"] = { "win32yank.exe", "-o", "--lf" },
      ["*"] = { "win32yank.exe", "-o", "--lf" },
    },
    cache_enabled = false,
  }
  vim.opt.clipboard = "unnamedplus"
end
vim.env.OPENAI_API_KEY =
  "REMOVED_API_KEY"

-- WSL terminal
if vim.fn.has("wsl") == 1 then
  -- Eliminate ESC key delay (default -1 uses timeoutlen ~1000ms)
  vim.opt.ttimeoutlen = 0

  -- Cursor shapes: block in normal, beam in insert, underline in replace
  vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

  -- Trigger resize when terminal window changes size
  vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
      vim.cmd("wincmd =")
    end,
  })
end

-- WSL file watching
if vim.fn.has("wsl") == 1 then
  -- Preserve inode on save (required for drvfs /mnt/c paths)
  vim.opt.backupcopy = "yes"

  -- Detect file changes from outside nvim
  vim.opt.autoread = true
  vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    callback = function()
      if vim.fn.mode() ~= "c" then
        vim.cmd("checktime")
      end
    end,
  })

  -- Disable LSP file watching for Windows paths (inotify doesn't work on 9p/drvfs)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and vim.startswith(vim.api.nvim_buf_get_name(args.buf), "/mnt/") then
        client.server_capabilities.workspace = client.server_capabilities.workspace or {}
        client.server_capabilities.workspace.didChangeWatchedFiles = { dynamicRegistration = false }
      end
    end,
  })
end
