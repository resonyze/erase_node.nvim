# Erase treesitter node

erase_node.lua:
```
return {
    dir = "/home/vector/plugins/erase_node.nvim",
    config = function()
      local er = require("erase_node")
      vim.keymap.set({ 'n', 'i' }, '<M-BS>', er.erase_node, { desc = "Erase node under cursor" })
    end
}
```
