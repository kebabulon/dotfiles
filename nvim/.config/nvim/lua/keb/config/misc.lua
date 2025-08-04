vim.api.nvim_create_autocmd("FileType", {
  pattern = "ron",
  callback = function()
    vim.bo.commentstring = "// %s"
  end
})
