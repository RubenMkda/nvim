local function parse_sessions(files, project_label)
  local sessions = {}
  for _, file in ipairs(files) do
    local session_id = vim.fn.fnamemodify(file, ":t:r")
    local mtime = vim.fn.getftime(file)
    local first_msg = ""

    local f = io.open(file, "r")
    if f then
      for line in f:lines() do
        local ok, data = pcall(vim.json.decode, line)
        if ok and data and data.type == "user" and data.message then
          local content = data.message.content
          if type(content) == "string" then
            first_msg = content:sub(1, 80)
          elseif type(content) == "table" then
            for _, part in ipairs(content) do
              if type(part) == "table" and part.type == "text" and part.text then
                first_msg = part.text:sub(1, 80)
                break
              end
            end
          end
          if first_msg ~= "" then
            break
          end
        end
      end
      f:close()
    end

    table.insert(sessions, {
      id = session_id,
      label = first_msg ~= "" and first_msg or "(empty session)",
      project = project_label,
      mtime = mtime,
    })
  end
  return sessions
end

local function resume_session(session)
  pcall(vim.cmd, "ClaudeCodeClose")
  vim.defer_fn(function()
    vim.cmd("ClaudeCodeOpen --resume " .. session.id)
  end, 100)
end

local function claude_session_picker()
  local cwd = vim.fn.getcwd()
  local project_slug = cwd:gsub("/", "-"):gsub("^%-", "")
  local sessions_dir = vim.fn.expand("~/.claude/projects/") .. project_slug .. "/"

  if vim.fn.isdirectory(sessions_dir) == 0 then
    vim.notify("No Claude sessions found for " .. cwd, vim.log.levels.WARN)
    return
  end

  local files = vim.fn.glob(sessions_dir .. "*.jsonl", false, true)
  if #files == 0 then
    vim.notify("No Claude sessions found", vim.log.levels.WARN)
    return
  end

  local sessions = parse_sessions(files, nil)
  table.sort(sessions, function(a, b)
    return a.mtime > b.mtime
  end)

  local items = vim.tbl_map(function(s)
    return string.format("[%s] %s", os.date("%m/%d %H:%M", s.mtime), s.label)
  end, sessions)

  vim.ui.select(items, { prompt = "Claude Sessions" }, function(_, idx)
    if not idx then return end
    resume_session(sessions[idx])
  end)
end

local function claude_all_sessions_picker()
  local base_dir = vim.fn.expand("~/.claude/projects/")
  if vim.fn.isdirectory(base_dir) == 0 then
    vim.notify("No Claude projects directory found", vim.log.levels.WARN)
    return
  end

  local project_dirs = vim.fn.glob(base_dir .. "*/", false, true)
  if #project_dirs == 0 then
    vim.notify("No Claude projects found", vim.log.levels.WARN)
    return
  end

  local all_sessions = {}
  for _, dir in ipairs(project_dirs) do
    local project_name = vim.fn.fnamemodify(dir:gsub("/$", ""), ":t")
    local readable = project_name:gsub("^%-", ""):gsub("%-", "/")
    local files = vim.fn.glob(dir .. "*.jsonl", false, true)
    if #files > 0 then
      local sessions = parse_sessions(files, readable)
      vim.list_extend(all_sessions, sessions)
    end
  end

  if #all_sessions == 0 then
    vim.notify("No Claude conversations found", vim.log.levels.WARN)
    return
  end

  table.sort(all_sessions, function(a, b)
    return a.mtime > b.mtime
  end)

  local items = vim.tbl_map(function(s)
    return string.format("[%s] %-30s %s", os.date("%m/%d %H:%M", s.mtime), s.project, s.label)
  end, all_sessions)

  vim.ui.select(items, { prompt = "All Claude Conversations" }, function(_, idx)
    if not idx then return end
    resume_session(all_sessions[idx])
  end)
end

return {
  "coder/claudecode.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    auto_start = true,
    log_level = "info",
    terminal = {
      provider = "snacks",
      position = "right",
      size = 0.35,
    },
  },
  keys = {
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude Code" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
    { "<leader>at", "<cmd>ClaudeCodeTreeAdd<cr>", desc = "Add file to Claude context" },
    { "<leader>aR", claude_session_picker, desc = "Resume Claude session (current project)" },
    { "<leader>aA", claude_all_sessions_picker, desc = "Browse all Claude conversations" },
  },
}
