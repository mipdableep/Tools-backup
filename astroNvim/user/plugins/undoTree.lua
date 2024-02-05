-- Configuration
return {
  "mbbill/undotree",
  keys = {
    {
      "U",
      function()
        vim.cmd.UndotreeToggle()
        vim.cmd.UndotreeFocus()
      end,
      desc = "open undotree ui",
      mode = "n",
    },
  },
}
