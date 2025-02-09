local dap = require("dap")

local function get_app_name()
  local app_name = vim.fn.input("Enter the app name: ")
  return app_name
end

dap.configurations.python = {
  {
    name = "uvicorn",
    type = "python",
    request = "launch",
    module = "uvicorn",
    args = { "xperix_generator:app", "--reload" },
    pythonPath = function()
      return "python"
    end,
  },
}
