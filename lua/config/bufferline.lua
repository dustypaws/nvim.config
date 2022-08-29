require('bufferline').setup({
    options = {
       mode = "buffers",
       numbers = "ordinal",
       always_show_bufferline = true,
       show_buffer_close_icons = false,
       show_close_icon = false,
       separator_style = "thin",
       sort_by = "insert_after_current",
       color_icons = false,
       diagnostics = "nvim_lsp",
       tab_size = 12,
       offsets = {
            {
                filetype = "NvimTree",
                text = "Nvim-Tree",
                text_align = "center",
                separator = true,
            }
        },
   },
})
