local cmd, fn = vim.cmd, vim.fn
local gl = require("galaxyline")
local section = gl.section
gl.short_line_list = {"LuaTree", "packager", "Floaterm", "coc-eplorer"}

local colours = require("theme.mountain")

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then return true
  end
  return false
end

section.left[1] = {
  FirstElement = {
    -- provider = function() return '▊ ' end,
    provider = function()
      return "  "
    end,
    highlight = {colours.blue, colours.statusline_bg}
  }
}
section.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colours.pink,
        i = colours.green,
        v = colours.blue,
        [""] = colours.blue,
        V = colours.blue,
        c = colours.red,
        no = colours.pink,
        s = colours.orange,
        S = colours.orange,
        [""] = colours.orange,
        ic = colours.yellow,
        R = colours.purple,
        Rv = colours.purple,
        cv = colours.red,
        ce = colours.red,
        r = colours.cyan,
        rm = colours.cyan,
        ["r?"] = colours.cyan,
        ["!"] = colours.red,
        t = colours.red
      }
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      return "   "
    end,
    highlight = {colours.red, colours.statusline_bg, "bold"}
  }
}
section.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.providers.fileinfo").get_file_icon_color, colours.statusline_bg}
  }
}
section.left[4] = {
  FileName = {
    -- provider = "FileName",
    provider = function()
      return fn.expand("%:F")
    end,
    condition = buffer_not_empty,
    separator = " ",
    separator_highlight = {colours.purple, colours.statusline_bg},
    highlight = {colours.purple, colours.statusline_bg, "bold"}
  }
}

section.right[1] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = require("galaxyline.providers.vcs").check_git_workspace,
    highlight = {colours.orange, colours.statusline_bg}
  }
}

section.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.providers.vcs").check_git_workspace,
    separator = "",
    separator_highlight = {colours.purple, colours.statusline_bg},
    highlight = {colours.orange, colours.statusline_bg, "bold"}
  }
}

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

section.right[3] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = "  ",
    separator = " ",
    separator_highlight = {colours.green, colours.statusline_bg},
    highlight = {colours.green, colours.statusline_bg}
  }
}
section.right[4] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = " 柳",
    highlight = {colours.yellow, colours.statusline_bg}
  }
}
section.right[5] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = "  ",
    highlight = {colours.red, colours.statusline_bg}
  }
}

section.right[6] = {
  LineInfo = {
    provider = "LineColumn",
    separator = "",
    separator_highlight = {colours.blue, colours.statusline_bg},
    highlight = {colours.fg, colours.statusline_bg}
  }
}
-- section.right[7] = {
--   FileSize = {
--     provider = "FileSize",
--     separator = " ",
--     condition = buffer_not_empty,
--     separator_highlight = {colours.blue, colours.statusline_bg},
--     highlight = {colours.fg, colours.statusline_bg}
--   }
-- }

section.right[8] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    -- separator = " ",
    icon = "   ",
    highlight = {colours.red, colours.statusline_bg},
    separator_highlight = {colours.statusline_bg, colours.statusline_bg}
  }
}
section.right[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    -- separator = " ",
    icon = "   ",
    highlight = {colours.yellow, colours.statusline_bg},
    separator_highlight = {colours.statusline_bg, colours.statusline_bg}
  }
}

section.right[10] = {
  DiagnosticInfo = {
    -- separator = " ",
    provider = "DiagnosticInfo",
    icon = "   ",
    highlight = {colours.green, colours.statusline_bg},
    separator_highlight = {colours.statusline_bg, colours.statusline_bg}
  }
}

section.right[11] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    -- separator = " ",
    icon = "   ",
    highlight = {colours.blue, colours.statusline_bg},
    separator_highlight = {colours.statusline_bg, colours.statusline_bg}
  }
}

section.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE', colours.statusline_bg},
    highlight = {colours.blue, colours.statusline_bg,'bold'}
  }
}

section.short_line_left[2] = {
  SFileName = {
    provider = function ()
      local fileinfo = require('galaxyline.providers.fileinfo')
      local fname = fileinfo.get_current_file_name()
      for _,v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ''
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = {colours.white, colours.statusline_bg,'bold'}
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colours.fg, colours.statusline_bg}
  }
}
