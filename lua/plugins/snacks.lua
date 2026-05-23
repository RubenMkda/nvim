return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<C-a>",    function() Snacks.terminal.toggle() end, desc = "Open Terminal",  mode = { "n", "t" } },
      { "<C-Down>", function() Snacks.terminal.toggle() end, desc = "Open Terminal",  mode = { "n", "t" } },
      { "<C-z>",    "<C-\\><C-n>:close<CR>",                desc = "Hide Terminal",  mode = "t" },
      { "<C-z>",    ":close<CR>",                            desc = "Hide Terminal",  mode = "n" },
    },
    opts = {
      terminal = { enabled = true },
      dashboard = {
        width = 60,
        row = nil,
        col = nil,
        pane_gap = 4,
        autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
        preset = {
          pick = nil,
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
          header = [[

  ██████╗ ██╗   ██╗██████╗ ███████╗███╗   ██╗███╗   ███╗██╗  ██╗██████╗  █████╗ 
  ██╔══██╗██║   ██║██╔══██╗██╔════╝████╗  ██║████╗ ████║██║ ██╔╝██╔══██╗██╔══██╗
  ██████╔╝██║   ██║██████╔╝█████╗  ██╔██╗ ██║██╔████╔██║█████╔╝ ██║  ██║███████║
  ██╔══██╗██║   ██║██╔══██╗██╔══╝  ██║╚██╗██║██║╚██╔╝██║██╔═██╗ ██║  ██║██╔══██║
  ██║  ██║╚██████╔╝██████╔╝███████╗██║ ╚████║██║ ╚═╝ ██║██║  ██╗██████╔╝██║  ██║
  ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝]],
        },
        formats = {
          icon = function(item)
            if item.file and (item.icon == "file" or item.icon == "directory") then
              return M.icon(item.file, item.icon)
            end
            return { item.icon, width = 2, hl = "icon" }
          end,
          footer = { "%s", align = "center" },
          header = { "%s", hl = "SnacksHeader", align = "center" },
          file = function(item, ctx)
            local fname = vim.fn.fnamemodify(item.file, ":~")
            fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
            if #fname > ctx.width then
              local dir = vim.fn.fnamemodify(fname, ":h")
              local file = vim.fn.fnamemodify(fname, ":t")
              if dir and file then
                file = file:sub(-(ctx.width - #dir - 2))
                fname = dir .. "/…" .. file
              end
            end
            local dir, file = fname:match("^(.*)/(.+)$")
            return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
          end,
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 10 },
          -- Terminal quitado para que no salga en dashboard default
          -- {
          --   section = "terminal",
          --   cmd = "pokemon-colorscripts --name gengar --no-title; sleep .1",
          --   random = 10,
          --   pane = 2,
          --   indent = 20,
          --   height = 30,
          -- },
        },
      },
    },
  },
}
