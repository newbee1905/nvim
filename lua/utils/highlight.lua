local cmd = vim.cmd
local highlight = {}

-- Define bg color
-- @param group Group
-- @param color Color
local bg = function(group, col)
	cmd("hi " .. group .. " guibg=" .. col)
end -- Define fg color
-- @param group Group
-- @param color Color
local fg = function(group, col)
	cmd("hi " .. group .. " guifg=" .. col)
end


-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
local fg_bg = function(group, fgcol, bgcol)
	 cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

function highlight:highlight(colours)
	local black = colours.black
	local black2 = colours.black2
	local blue = colours.blue
	local darker_black = colours.darker_black
	local folder_bg = colours.folder_bg
	local green = colours.green
	local grey = colours.grey
	local light_grey = colours.light_grey
	local grey_fg = colours.grey_fg
	local line = colours.line
	local nord_blue = colours.nord_blue
	local one_bg = colours.one_bg
	local one_bg2 = colours.one_bg2
	local pmenu_bg = colours.pmenu_bg
	local purple = colours.purple
	local red = colours.red
	local white = colours.white
	local darker_white = colours.darker_white
	local yellow = colours.yellow
	local orange = colours.orange
	local one_bg3 = colours.one_bg3

	-- Comments
	-- fg("Comment", grey_fg .. " gui=italic")
	fg("Comment", light_grey .. " gui=italic")

	-- Disable cursor line
	cmd "hi clear CursorLine"

	-- Clearer Visual
	bg("Visual", darker_black)

	-- Line number
	fg("cursorlinenr", white)

	-- same it bg, so it doesn't appear
	fg("EndOfBuffer", black)

	-- For floating windows
	fg("FloatBorder", blue)
	bg("NormalFloat", darker_black)

	-- Pmenu
	bg("Pmenu", one_bg)
	bg("PmenuSbar", one_bg2)
	bg("PmenuSel", pmenu_bg)
	bg("PmenuThumb", nord_blue)
	fg("CmpItemAbbr", white)
	fg("CmpItemAbbrMatch", white)
	fg("CmpItemKind", white)
	fg("CmpItemMenu", white)

	-- misc

	-- inactive statuslines as thin lines
	fg("StatusLineNC", one_bg3 .. " gui=underline")

	fg("LineNr", grey)
	fg("NvimInternalError", red)
	fg("VertSplit", one_bg2)

	-- Transparency
	bg("Normal", "NONE")
	bg("Folded", "NONE")
	fg("Folded", "NONE")
	
	bg("NormalFloat", "NONE")
	bg("NvimTreeNormal", "NONE")
	bg("NvimTreeNormalNC", "NONE")
	bg("NvimTreeStatusLineNC", "NONE")
	bg("NvimTreeVertSplit", "NONE")
	fg("NvimTreeVertSplit", grey)
	
	-- telescope
	bg("TelescopeBorder", "NONE")
	bg("TelescopePrompt", "NONE")
	bg("TelescopeResults", "NONE")
	bg("TelescopePromptBorder", "NONE")
	bg("TelescopePromptNormal", "NONE")
	bg("TelescopeNormal", "NONE")
	bg("TelescopePromptPrefix", "NONE")
	fg("TelescopeBorder", one_bg)
	fg_bg("TelescopeResultsTitle", black, blue)

	-- [[ Plugin Highlights

	-- Dashboard
	fg("DashboardCenter", grey_fg)
	fg("DashboardFooter", grey_fg)
	fg("DashboardHeader", grey_fg)
	fg("DashboardShortcut", grey_fg)
	fg("AlphaHeader", darker_white)
	fg("AlphaButtons", darker_white)

	-- Git signs
	fg_bg("DiffAdd", blue, "NONE")
	fg_bg("DiffChange", grey_fg, "NONE")
	fg_bg("DiffChangeDelete", red, "NONE")
	fg_bg("DiffModified", red, "NONE")
	fg_bg("DiffDelete", red, "NONE")

	-- Indent blankline plugin
	fg("IndentBlanklineChar", line)
	fg("IndentBlanklineSpaceChar", line)

	-- Lsp diagnostics

	fg("DiagnosticHint", purple)
	fg("DiagnosticError", red)
	fg("DiagnosticWarn", yellow)
	fg("DiagnosticInformation", green)

	-- NvimTree
	fg("NvimTreeEmptyFolderName", blue)
	fg("NvimTreeEndOfBuffer", darker_black)
	fg("NvimTreeFolderIcon", folder_bg)
	fg("NvimTreeFolderName", folder_bg)
	fg("NvimTreeGitDirty", red)
	fg("NvimTreeIndentMarker", one_bg2)
	bg("NvimTreeNormal", darker_black)
	bg("NvimTreeNormalNC", darker_black)
	fg("NvimTreeOpenedFolderName", blue)
	fg("NvimTreeRootFolder", red .. " gui=underline") -- enable underline for root folder in nvim tree
	fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
	fg("NvimTreeVertSplit", darker_black)
	bg("NvimTreeVertSplit", darker_black)
	fg_bg("NvimTreeWindowPicker", red, black2)

	-- Telescope
	fg_bg("TelescopeBorder", darker_black, darker_black)
	fg_bg("TelescopePromptBorder", black2, black2)

	fg_bg("TelescopePromptNormal", white, black2)
	fg_bg("TelescopePromptPrefix", red, black2)

	bg("TelescopeNormal", darker_black)

	fg_bg("TelescopePreviewTitle", black, green)
	fg_bg("TelescopePromptTitle", black, red)
	fg_bg("TelescopeResultsTitle", darker_black, darker_black)

	bg("TelescopeSelection", black2)

	-- keybinds cheatsheet

	fg_bg("CheatsheetBorder", black, black)
	bg("CheatsheetSectionContent", black)
	fg("CheatsheetHeading", white)

	local section_title_colors = {
		white,
		blue,
		red,
		green,
		yellow,
		purple,
		orange,
	}
	for i, color in ipairs(section_title_colors) do
		cmd("hi CheatsheetTitle" .. i .. " guibg = " .. color .. " guifg=" .. black)
	end
end

return highlight
