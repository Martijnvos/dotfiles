local function fetch_git_branch()
    local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    local branchname = handle:read("*a")
    handle:close()

    if string.len(branchname) > 0 then
        return " " .. branchname .. " "
    end
    return ""
end

function construct_status_line()
    return table.concat {
        "%#PmenuSel#", -- Popup menu selected highlight color
        fetch_git_branch(),
        "%#LineNr#", -- Line number highlight color
        " %F", -- Full file path
        " %m", -- Modified flag
        "%r", -- Readonly flag
        "%=", -- Separation point between left and right aligned items
        "%#CursorColumn#",
        vim.opt.paste:get() and " PASTE " or "",
        " %y", -- Type of file
        " " .. (string.len(vim.bo.fileencoding) > 0 and vim.bo.fileencoding or vim.o.encoding),
        " [" .. vim.bo.fileformat .. "]",
        " %p%%", -- Percentage through file in lines
        " %c", -- Current column count
        " " -- Closing space for breathing room
    }
end

vim.opt.statusline = "%!luaeval(\"construct_status_line()\")"
