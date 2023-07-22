# Erase treesitter node

erase_node.lua:
```
return {
    dir = "/home/vector/plugins/erase_node.nvim",
    config = function()
      local erase_node = require("erase_node")
      vim.keymap.set({ 'n', 'i' }, '<M-BS>', M.erase_node, { desc = "Erase node under cursor" })
    end
}
```
