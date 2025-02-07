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
    args = { "xperix_generator:app", "--reload" },
  },
  {
    type = "python",
    request = "launch",
    name = "Launch Celery Worker",
    module = "celery",
    args = { "--app", "xperix_generator.celery", "worker", "--loglevel=info", "--concurrency=1" },
  },
}
