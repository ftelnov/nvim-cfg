local lint = require "lint"

lint.linters.clippy = {
  cmd = "cargo",
  stdin = false,
  append_fname = false,
  args = { "clippy" },
  stream = nil,
  ignore_exitcode = false,
  env = nil,
}

lint.linters_by_ft = {
  markdown = { "vale" },
  -- rust = { "clippy" },
}
