return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1001,
  opts = {
    style = "night",
    on_colors = function(colors)
      colors.hint = colors.orange
      colors.error = "#ff0000"
    end
  },
}
