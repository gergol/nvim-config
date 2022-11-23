return {
  ["github/copilot"] = {
    as = "copilot",
    config = function()
      vim.cmd("let g:copilot_no_tab_map = v:true")
    end
  }
}
