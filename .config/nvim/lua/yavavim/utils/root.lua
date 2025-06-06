--- Find the project root directory
--- @param opts? {patterns?: string[], path?: string} optional configuration
--- @return string|nil root_dir returns the root directory or nil if not found

local M = setmetatable({}, {
    __call = function(m, ...)
        return m.find_project_root(...)
    end,
})

function M.find_project_root(opts)
    opts = opts or {}
    local patterns = opts.patterns or {
        ".git",
        ".hg",
        ".svn",
        ".root",
        "package.json",
        "Makefile",
        "init.lua",
    }
    local path = opts.path or vim.fn.expand("%:p:h") or vim.loop.cwd()

    -- Check if the current path contains any of the root markers
    local function has_root_markers(p)
        for _, pattern in ipairs(patterns) do
            if vim.fn.filereadable(p .. "/" .. pattern) == 1 or vim.fn.isdirectory(p .. "/" .. pattern) == 1 then
                return true
            end
        end
        return false
    end

    -- Walk up the directory tree to find the root
    local function get_root_directory(current)
        local prev = current
        while current do
            if has_root_markers(current) then
                return current
            end
            prev = current
            current = vim.fn.fnamemodify(current, ":h")
            -- Reached the top of the directory tree
            if current == prev then
                break
            end
        end
        return nil
    end

    return get_root_directory(path)
end

return M
