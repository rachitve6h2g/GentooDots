return {
    {
       'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = 1
        vim.g.gruvbox_material_background = 'dark'
        vim.g.gruvbox_material_foreground = 'mix'
        vim.g.gruvbox_material_enable_bold = 1
        vim.g.gruvbox_material_transparent_background = 2
        vim.g.gruvbox_material_statusline_style = 'mix'
        vim.cmd.colorscheme('gruvbox-material')
      end
    }
}
