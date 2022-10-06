local options = {
    splitbelow = true, -- splits open at the bottom instead of top
    splitright = true, -- splits open at the right instead of left
    number = true, -- show line number
    relativenumber = true, -- use relative line number
    cmdheight = 2, -- provide more space for displaying messages
    ignorecase = true, -- use case insensitive search
    smartcase = true, -- don't use case insensitive search on capital letter input
    tabstop = 4, -- tab size
    shiftwidth = 4, -- determine indentation per level
    expandtab = true, -- expand tab to spaces
    undofile = true, -- remember undo's on buffer close
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.path:append "**" -- For clever completion with the :find command
