local C = require("colours.colour")
local Shade = require("colours.shade")

local meta = {
	name = "nightowl",
	dark = true,
}

-- stylua: ignore
local palette = {
	black   = Shade.new("#011627", "#011e36", "#000a12", false),
	red     = Shade.new("#ff5874", "#ff5874", "#ff5874", false),
	green   = Shade.new("#addb67", "#addb67", "#addb67", false),
	yellow  = Shade.new("#ecc48d", "#fbec9f", "#f78c6c", false),
	blue    = Shade.new("#82aaff", "#5f7e97", "#295e73", false),
	magenta = Shade.new("#c792ea", "#c792ea", "#2d2c5d", false),
	cyan    = Shade.new("#7fdbca", "#7fdbca", "#7fdbca", false),
	white   = Shade.new("#d6deeb", "#eeeeee", "#d6deeb", false),
	orange  = Shade.new("#ff9058", "#ff9058", "#ca6e69", false),
	pink    = Shade.new("#ff58c5", "#ff58c5", "#ff58c5", false),

	comment = "#9893a5",

	bg0     = "#000a12", -- Dark bg (status line and float)
	bg1     = "#011627", -- Default bg
	bg2     = "#011e36", -- Lighter bg (colorcolm folds)
	bg3     = "#01213b", -- Lighter bg (cursor line)
	bg4     = "#052138", -- Conceal, border fg

	fg0     = "#eeeeee", -- Lighter fg
	fg1     = "#d6deeb", -- Default fg
	fg2     = "#c1c8d4", -- Darker fg (status line)
	fg3     = "#aeb4bf", -- Darker fg (line numbers, fold colums)

	sel0    = "#000a12", -- Popup bg, visual selection bg
	sel1    = "#052138", -- Popup sel bg, search bg
}

local function generate_spec(pal)
	-- stylua: ignore start
	local spec = {
		bg0  = pal.bg0,  -- Dark bg (status line and float)
		bg1  = pal.bg1,  -- Default bg
		bg2  = pal.bg2,  -- Lighter bg (colorcolm folds)
		bg3  = pal.bg3,  -- Lighter bg (cursor line)
		bg4  = pal.bg4,  -- Conceal, border fg

		fg0  = pal.fg0,  -- Lighter fg
		fg1  = pal.fg1,  -- Default fg
		fg2  = pal.fg2,  -- Darker fg (status line)
		fg3  = pal.fg3,  -- Darker fg (line numbers, fold colums)

		sel0 = pal.sel0, -- Popup bg, visual selection bg
		sel1 = pal.sel1, -- Popup sel bg, search bg
	}

	spec.syntax = {
		bracket     = spec.fg2,         -- Brackets and Punctuation
		builtin0    = pal.red.base,     -- Builtin variable
		builtin1    = pal.cyan.dim,     -- Builtin type
		builtin2    = pal.orange.dim,   -- Builtin const
		builtin3    = pal.red.dim,      -- Not used
		comment     = pal.comment,      -- Comment
		conditional = pal.magenta.dim,  -- Conditional and loop
		const       = pal.orange.dim,   -- Constants, imports and booleans
		dep         = spec.fg3,         -- Deprecated
		field       = pal.blue.base,    -- Field
		func        = pal.blue.dim,     -- Functions and Titles
		ident       = pal.cyan.base,    -- Identifiers
		keyword     = pal.magenta.base, -- Keywords
		number      = pal.orange.base,  -- Numbers
		operator    = spec.fg2,         -- Operators
		preproc     = pal.pink.dim,     -- PreProc
		regex       = pal.yellow.dim,   -- Regex
		statement   = pal.magenta.base, -- Statements
		string      = pal.green.base,   -- Strings
		type        = pal.yellow.base,  -- Types
		variable    = pal.black.base,   -- Variables
	}

	spec.diag = {
		error = pal.red.base,
		warn  = pal.yellow.base,
		info  = pal.blue.base,
		hint  = pal.green.base,
	}

	spec.diag_bg = {
		error = C(spec.bg1):blend(C(spec.diag.error), 0.3):to_css(),
		warn  = C(spec.bg1):blend(C(spec.diag.warn), 0.3):to_css(),
		info  = C(spec.bg1):blend(C(spec.diag.info), 0.3):to_css(),
		hint  = C(spec.bg1):blend(C(spec.diag.hint), 0.3):to_css(),
	}

	spec.diff = {
		add    = C(spec.bg1):blend(C(pal.green.base), 0.2):to_css(),
		delete = C(spec.bg1):blend(C(pal.red.base), 0.2):to_css(),
		change = C(spec.bg1):blend(C(pal.blue.base), 0.2):to_css(),
		text   = C(spec.bg1):blend(C(pal.blue.base), 0.4):to_css(),
	}

	spec.git = {
		add      = pal.green.base,
		removed  = pal.red.base,
		changed  = pal.yellow.base,
		conflict = pal.orange.base,
		ignored  = pal.comment,
	}

	-- stylua: ignore start

	return spec
end

return { meta = meta, palette = palette, generate_spec = generate_spec }
