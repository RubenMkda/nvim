return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-phpunit",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-phpunit")({
          phpunit_cmd = "./vendor/bin/phpunit",
        })
      )
    end,
  },
}
