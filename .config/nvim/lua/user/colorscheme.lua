require("catppuccin").setup {
    color_overrides = {
        mocha = {
            base = "#131111",
        },
    }
}

vim.cmd [[
    try
        colorscheme catppuccin
    catch
        colorscheme default
    endtry
]]
