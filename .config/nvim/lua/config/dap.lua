require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

local dap = require("dap")

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch Python Script",
    program = "${file}",
  },
  {
    type = "python",
    request = "launch",
    name = "Launch Uvicorn",
    module = "uvicorn",
    args = { "main:app", "--reload" },
  },
  {
    type = "python",
    request = "launch",
    name = "Launch Celery Worker",
    module = "celery",
    args = { "--app", "main.celery", "worker", "--loglevel=info", "--concurrency=1" },
  },
}
