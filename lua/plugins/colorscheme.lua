return {
  { "folke/tokyonight.nvim", enabled = false },
  {
    "catppuccin/nvim",
    name = "catppuccin-mocha",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.25,
        },
        custom_highlights = function(colors)
          return {
            NormalNC = { bg = "NONE" },
            NormalFloat = { bg = "NONE" },
            FloatBorder = { bg = "NONE", fg = colors.surface2 },
          }
        end,
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
