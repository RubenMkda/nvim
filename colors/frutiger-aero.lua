-- Frutiger Aero colorscheme for Neovim
-- Inspired by the glassy, aquatic, nature-tech aesthetic of 2004-2013

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "frutiger-aero"
vim.o.termguicolors = true

local c = {
  -- Backgrounds (deep ocean / night sky)
  bg = "NONE",
  bg_dark = "#040A16",
  bg_dim = "#060E1E",
  bg_panel = "#08132A",
  bg_hl = "#0F2444",
  bg_sel = "#12345E",
  bg_visual = "#1A4872",
  bg_float = "#060E1E",

  -- Foregrounds
  fg = "#C2E5FF", -- ice blue-white
  fg_dim = "#6EA8C8", -- ocean mist (comments)
  fg_muted = "#3D6E8A", -- very muted

  -- Syntax palette (sky + nature)
  sky = "#5BC8F5", -- sky blue     → keywords
  aqua = "#3DD4E0", -- aqua/cyan    → strings
  teal = "#2ABFCA", -- deep teal    → types / classes
  green = "#78D47A", -- leaf green   → functions
  ltgreen = "#9CD49A", -- soft green   → operators / booleans
  lavender = "#A0AADC", -- lavender     → special / tags
  violet = "#C8A8F0", -- soft violet  → constructors / decorators
  amber = "#FFD47A", -- warm amber   → numbers
  orange = "#FFB864", -- sunset orange→ warnings
  white = "#E8F4FF", -- near white   → constants
  red = "#FF7A9A", -- soft red     → errors
  pink = "#F0A0C0", -- sakura       → diff removed

  -- UI chrome
  border = "#1A5A90", -- glassy border
  border_hl = "#2A80C8", -- focused border
  line_nr = "#2A5070", -- line numbers
  cursor_ln = "#0D2040", -- cursorline
  indent = "#112238", -- indent guides
  diff_add = "#0D3020",
  diff_chg = "#1A2E10",
  diff_del = "#3A1020",
  diff_txt = "#1E4A60",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ─── Editor UI ────────────────────────────────────────────────────────────────
hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalNC", { fg = c.fg_dim, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg_float })
hi("FloatBorder", { fg = c.border, bg = "NONE" })
hi("FloatTitle", { fg = c.sky, bg = "NONE", bold = true })

hi("Cursor", { fg = c.bg_dim, bg = c.sky })
hi("CursorLine", { bg = c.cursor_ln })
hi("CursorLineNr", { fg = c.sky, bg = "NONE", bold = true })
hi("CursorColumn", { bg = c.cursor_ln })

hi("LineNr", { fg = c.line_nr })
hi("SignColumn", { bg = "NONE" })
hi("ColorColumn", { bg = c.bg_panel })
hi("FoldColumn", { fg = c.line_nr, bg = "NONE" })
hi("Folded", { fg = c.fg_dim, bg = c.bg_panel })

hi("Visual", { bg = c.bg_visual })
hi("VisualNOS", { bg = c.bg_sel })
hi("Search", { fg = c.bg_dim, bg = c.amber })
hi("IncSearch", { fg = c.bg_dim, bg = c.sky, bold = true })
hi("CurSearch", { fg = c.bg_dim, bg = c.aqua, bold = true })
hi("Substitute", { fg = c.bg_dim, bg = c.orange })

hi("StatusLine", { fg = c.fg, bg = "NONE" })
hi("StatusLineNC", { fg = c.fg_dim, bg = "NONE" })
hi("WinBar", { fg = c.sky, bg = "NONE", bold = true })
hi("WinBarNC", { fg = c.fg_dim, bg = "NONE" })
hi("WinSeparator", { fg = c.border })

hi("TabLine", { fg = c.fg_dim, bg = "NONE" })
hi("TabLineFill", { bg = "NONE" })
hi("TabLineSel", { fg = c.sky, bg = "NONE", bold = true })

hi("Pmenu", { fg = c.fg, bg = c.bg_panel })
hi("PmenuSel", { fg = c.bg_dim, bg = c.sky, bold = true })
hi("PmenuSbar", { bg = c.bg_panel })
hi("PmenuThumb", { bg = c.border })

hi("EndOfBuffer", { fg = c.bg_dim })
hi("NonText", { fg = c.fg_muted })
hi("SpecialKey", { fg = c.teal })
hi("Whitespace", { fg = c.indent })
hi("MatchParen", { fg = c.amber, bold = true, underline = true })

hi("Directory", { fg = c.sky, bold = true })
hi("Title", { fg = c.sky, bold = true })
hi("Question", { fg = c.green })
hi("MoreMsg", { fg = c.green })
hi("ModeMsg", { fg = c.sky, bold = true })
hi("ErrorMsg", { fg = c.red })
hi("WarningMsg", { fg = c.orange })

-- ─── Syntax ───────────────────────────────────────────────────────────────────
hi("Comment", { fg = c.fg_dim, italic = true })
hi("Constant", { fg = c.white })
hi("String", { fg = c.aqua })
hi("Character", { fg = c.aqua })
hi("Number", { fg = c.amber })
hi("Float", { fg = c.amber })
hi("Boolean", { fg = c.ltgreen })

hi("Identifier", { fg = c.fg })
hi("Function", { fg = c.green })

hi("Statement", { fg = c.violet })
hi("Conditional", { fg = c.violet })
hi("Repeat", { fg = c.violet })
hi("Label", { fg = c.lavender })
hi("Operator", { fg = c.ltgreen })
hi("Keyword", { fg = c.violet, bold = true })
hi("Exception", { fg = c.red })

hi("PreProc", { fg = c.lavender })
hi("Include", { fg = c.aqua })
hi("Define", { fg = c.lavender })
hi("Macro", { fg = c.violet })
hi("PreCondit", { fg = c.lavender })

hi("Type", { fg = c.teal })
hi("StorageClass", { fg = c.lavender })
hi("Structure", { fg = c.teal })
hi("Typedef", { fg = c.teal })

hi("Special", { fg = c.lavender })
hi("SpecialChar", { fg = c.aqua })
hi("Tag", { fg = c.lavender })
hi("Delimiter", { fg = c.fg_dim })
hi("SpecialComment", { fg = c.teal, italic = true })
hi("Debug", { fg = c.orange })

hi("Underlined", { underline = true })
hi("Ignore", { fg = c.fg_muted })
hi("Error", { fg = c.red, bold = true })
hi("Todo", { fg = c.bg_dim, bg = c.amber, bold = true })

-- ─── Treesitter ───────────────────────────────────────────────────────────────
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.orange, italic = true })
hi("@variable.parameter", { fg = c.fg })
hi("@variable.member", { fg = c.aqua })

hi("@constant", { fg = c.white })
hi("@constant.builtin", { fg = c.ltgreen })
hi("@constant.macro", { fg = c.violet })

hi("@string", { fg = c.aqua })
hi("@string.escape", { fg = c.teal })
hi("@string.special", { fg = c.teal })
hi("@string.regex", { fg = c.teal })

hi("@number", { fg = c.amber })
hi("@float", { fg = c.amber })
hi("@boolean", { fg = c.ltgreen })

hi("@function", { fg = c.green })
hi("@function.builtin", { fg = c.green, italic = true })
hi("@function.call", { fg = c.green })
hi("@function.macro", { fg = c.violet })
hi("@function.method", { fg = c.green })
hi("@function.method.call", { fg = c.green })

hi("@constructor", { fg = c.violet })
hi("@operator", { fg = c.ltgreen })

hi("@keyword", { fg = c.violet, bold = true })
hi("@keyword.function", { fg = c.violet, bold = true })
hi("@keyword.operator", { fg = c.lavender })
hi("@keyword.return", { fg = c.violet, bold = true })
hi("@keyword.import", { fg = c.aqua })
hi("@keyword.conditional", { fg = c.violet })
hi("@keyword.repeat", { fg = c.violet })
hi("@keyword.exception", { fg = c.red })

hi("@type", { fg = c.teal })
hi("@type.builtin", { fg = c.teal, italic = true })
hi("@type.definition", { fg = c.teal })

hi("@attribute", { fg = c.lavender })
hi("@property", { fg = c.aqua })
hi("@field", { fg = c.aqua })

hi("@tag", { fg = c.lavender })
hi("@tag.attribute", { fg = c.aqua })
hi("@tag.delimiter", { fg = c.fg_dim })

hi("@punctuation.delimiter", { fg = c.fg_dim })
hi("@punctuation.bracket", { fg = c.fg_dim })
hi("@punctuation.special", { fg = c.teal })

hi("@comment", { fg = c.fg_dim, italic = true })
hi("@comment.todo", { fg = c.amber, bold = true })
hi("@comment.warning", { fg = c.orange, bold = true })
hi("@comment.error", { fg = c.red, bold = true })

hi("@namespace", { fg = c.lavender })
hi("@module", { fg = c.lavender })
hi("@label", { fg = c.lavender })

-- ─── LSP ──────────────────────────────────────────────────────────────────────
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.orange })
hi("DiagnosticInfo", { fg = c.sky })
hi("DiagnosticHint", { fg = c.teal })
hi("DiagnosticOk", { fg = c.green })

hi("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
hi("DiagnosticUnderlineWarn", { sp = c.orange, undercurl = true })
hi("DiagnosticUnderlineInfo", { sp = c.sky, undercurl = true })
hi("DiagnosticUnderlineHint", { sp = c.teal, undercurl = true })

hi("DiagnosticVirtualTextError", { fg = c.red, italic = true })
hi("DiagnosticVirtualTextWarn", { fg = c.orange, italic = true })
hi("DiagnosticVirtualTextInfo", { fg = c.sky, italic = true })
hi("DiagnosticVirtualTextHint", { fg = c.teal, italic = true })

hi("LspReferenceText", { bg = c.bg_sel })
hi("LspReferenceRead", { bg = c.bg_sel })
hi("LspReferenceWrite", { bg = c.bg_sel, bold = true })
hi("LspInlayHint", { fg = c.fg_muted, italic = true })

-- ─── Diff ─────────────────────────────────────────────────────────────────────
hi("DiffAdd", { bg = c.diff_add })
hi("DiffChange", { bg = c.diff_chg })
hi("DiffDelete", { fg = c.pink, bg = c.diff_del })
hi("DiffText", { bg = c.diff_txt, bold = true })
hi("Added", { fg = c.green })
hi("Changed", { fg = c.sky })
hi("Removed", { fg = c.pink })

-- ─── Git signs ────────────────────────────────────────────────────────────────
hi("GitSignsAdd", { fg = c.green })
hi("GitSignsChange", { fg = c.sky })
hi("GitSignsDelete", { fg = c.pink })

-- ─── Snacks / notifications ───────────────────────────────────────────────────
hi("SnacksNormal", { fg = c.fg, bg = c.bg_float })
hi("SnacksBorder", { fg = c.border, bg = "NONE" })
hi("SnacksTitle", { fg = c.sky, bold = true })
hi("SnacksBackdrop", { bg = c.bg_dark })
hi("SnacksHeader", { fg = c.sky, bold = true })
hi("SnacksDashboardTitle", { fg = c.sky, bold = true })
hi("SnacksDashboardDesc", { fg = c.aqua })
hi("SnacksDashboardKey", { fg = c.amber })
hi("SnacksDashboardIcon", { fg = c.teal })
hi("SnacksDashboardFooter", { fg = c.fg_muted, italic = true })
hi("SnacksIndent", { fg = c.indent })
hi("SnacksIndentScope", { fg = c.border })

-- ─── Telescope ────────────────────────────────────────────────────────────────
hi("TelescopeBorder", { fg = c.border })
hi("TelescopeTitle", { fg = c.sky, bold = true })
hi("TelescopePromptPrefix", { fg = c.sky })
hi("TelescopeSelection", { bg = c.bg_sel })
hi("TelescopeMatching", { fg = c.amber, bold = true })

-- ─── Blink CMP ────────────────────────────────────────────────────────────────
hi("BlinkCmpMenu", { fg = c.fg, bg = c.bg_panel })
hi("BlinkCmpMenuBorder", { fg = c.border, bg = "NONE" })
hi("BlinkCmpMenuSelection", { fg = c.bg_dim, bg = c.sky, bold = true })
hi("BlinkCmpLabel", { fg = c.fg })
hi("BlinkCmpLabelMatch", { fg = c.amber, bold = true })
hi("BlinkCmpKind", { fg = c.teal })
hi("BlinkCmpKindFunction", { fg = c.green })
hi("BlinkCmpKindKeyword", { fg = c.sky })
hi("BlinkCmpKindVariable", { fg = c.fg })
hi("BlinkCmpKindClass", { fg = c.teal })
hi("BlinkCmpKindModule", { fg = c.lavender })
hi("BlinkCmpDoc", { fg = c.fg, bg = c.bg_panel })
hi("BlinkCmpDocBorder", { fg = c.border, bg = "NONE" })

-- ─── Mini files ───────────────────────────────────────────────────────────────
hi("MiniFilesDirectory", { fg = c.sky, bold = true })
hi("MiniFilesFile", { fg = c.fg })
hi("MiniFilesBorder", { fg = c.border, bg = "NONE" })
hi("MiniFilesBorderModified", { fg = c.orange, bg = "NONE" })
hi("MiniFilesCursorLine", { bg = c.cursor_ln })
hi("MiniFilesTitle", { fg = c.sky, bg = "NONE", bold = true })
hi("MiniFilesTitleFocused", { fg = c.aqua, bg = "NONE", bold = true })
hi("MiniFilesNormal", { fg = c.fg, bg = "NONE" })

-- ─── Which-key ────────────────────────────────────────────────────────────────
hi("WhichKey", { fg = c.sky })
hi("WhichKeyDesc", { fg = c.fg })
hi("WhichKeyGroup", { fg = c.teal, bold = true })
hi("WhichKeySeparator", { fg = c.fg_muted })
hi("WhichKeyBorder", { fg = c.border })

-- ─── Illuminate ───────────────────────────────────────────────────────────────
hi("IlluminatedWordText", { bg = c.bg_sel })
hi("IlluminatedWordRead", { bg = c.bg_sel })
hi("IlluminatedWordWrite", { bg = c.bg_visual })

-- ─── Indent blankline ─────────────────────────────────────────────────────────
hi("IblIndent", { fg = c.indent })
hi("IblScope", { fg = c.border })

-- ─── Neo-tree ─────────────────────────────────────────────────────────────────
hi("NeoTreeNormal", { fg = c.fg, bg = "NONE" })
hi("NeoTreeNormalNC", { fg = c.fg_dim, bg = "NONE" })
hi("NeoTreeDirectoryName", { fg = c.sky, bold = true })
hi("NeoTreeDirectoryIcon", { fg = c.teal })
hi("NeoTreeFileName", { fg = c.fg })
hi("NeoTreeRootName", { fg = c.aqua, bold = true })
hi("NeoTreeGitAdded", { fg = c.green })
hi("NeoTreeGitModified", { fg = c.sky })
hi("NeoTreeGitDeleted", { fg = c.pink })
hi("NeoTreeIndentMarker", { fg = c.indent })
hi("NeoTreeExpander", { fg = c.fg_muted })
hi("NeoTreeFloatBorder", { fg = c.border })
hi("NeoTreeTitleBar", { fg = c.sky, bold = true })
