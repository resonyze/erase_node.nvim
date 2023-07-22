M = {}

M.erase_node = function()
  local bufnr = vim.api.nvim_get_current_buf()

  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local row = cursor_pos[1] - 1
  local col = cursor_pos[2]

  local char_at_cursor = vim.api.nvim_buf_get_text(bufnr, row, col, row, col + 1, {})[1]
  while char_at_cursor == ' ' or char_at_cursor == '' do
    if col - 1 > 0 then
      col = col - 1
    else
      break
    end
    char_at_cursor = vim.api.nvim_buf_get_text(bufnr, row, col, row, col + 1, {})[1]
  end

  if vim.fn.mode() == 'i' then
    if vim.api.nvim_buf_get_text(0, row, col - 1, row, col, {})[1] ~= ' ' then
      if col - 1 > 0 then
        col = col - 1
      end
    end
  end

  local nuc = vim.treesitter.get_node({bufnr = 0, pos = {row, col}, ignore_injection= true})

  local start_row, start_column, end_row, end_column = nuc:range()
  vim.api.nvim_win_set_cursor(0, { start_row + 1, start_column })
  vim.api.nvim_buf_set_text(bufnr, start_row, start_column, end_row, end_column, { '' })
end

-- function save_and_execute()
--   vim.cmd(":w")
--   vim.cmd("source " .. vim.fn.expand('%'))
-- end
--
-- vim.keymap.set({'n', 'i'}, '<M-BS>', save_and_execute, {} )

-- M.erase_node()

return M
