return {
  {
    "saghen/blink.cmp",
    build = "cargo +nightly build --release",
    opts = {
      cmdline = {
        enabled = true,
      },
      sources = {
        providers = {
          omni = {
            module = "blink.cmp.sources.complete_func",
            enabled = true,
            opts = {
              complete_func = function()
                return vim.bo.omnifunc
              end,
            },
          },
        },
      },
    },
  },
}
