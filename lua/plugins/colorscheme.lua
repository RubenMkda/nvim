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
        transparent_background = false,
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.25,
        },
        custom_highlights = function(colors)
          return {
            Normal = { bg = "#050505" },
            NormalNC = { bg = "#050505" },
            NormalFloat = { bg = "#050505" },
            FloatBorder = { bg = "#050505", fg = colors.surface2 },
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
