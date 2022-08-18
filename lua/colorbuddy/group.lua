local colors = require("colorbuddy.color").colors
local styles = require("colorbuddy.style").styles

local is_color_object = require("colorbuddy.color").is_color_object
local is_style_object = require("colorbuddy.style").is_style_object

local is_group_object = function(g)
	if g == nil then
		return false
	end

	return g.__type__ == "group"
end

local _group_hash = {}

local groups = setmetatable({}, {
	__index = function(_, raw_key)
		local key = string.lower(raw_key)

		if _group_hash[key] ~= nil then
			return _group_hash[key]
		end

		return {}
	end,

	__newindex = function(_, raw_key, value)
		local key = string.lower(raw_key)
		_group_hash[key] = value
	end,
})

local Group = {}

Group.__index = Group
Group.__tostring = function(self)
	if self == nil then
		return ""
	end

	return string.format(
		"[%s: fg=%s, bg=%s, s=%s]",
		tostring(self.name),
		tostring(self.fg.name),
		tostring(self.bg.name),
		tostring(self.style.name)
	)
end

Group._defaults = {
	fg = colors.none,
	bg = colors.none,
	style = styles.none,
	guisp = colors.none,
}

Group.is_existing_group = function(key)
	return _group_hash[string.lower(key)] ~= nil
end

Group.__private_create = function(name, fg, bg, style, guisp, blend, default)
	vim.validate({
		name = { name, "string" },
		fg = {
			fg,
			function(arg)
				if not arg then
					return true
				end
				if not is_color_object(arg) then
					return false, "Bad foreground color: " .. debug.traceback()
				end
				return true
			end,
		},
		bg = {
			bg,
			function(arg)
				if not arg then
					return true
				end
				if not is_color_object(arg) then
					return false, "Bad background color: " .. debug.traceback()
				end
				return true
			end,
		},
		guisp = {
			guisp,
			function(arg)
				if not arg then
					return true
				end
				if not is_color_object(arg) then
					return false, "Bad guisp color: " .. debug.traceback()
				end
				return true
			end,
		},
		style = {
			style,
			function(arg)
				if not arg then
					return true
				end
				if not is_style_object(arg) then
					return false, "Bad style: " .. debug.traceback()
				end
				return true
			end,
		},
	})

	if not fg then
		fg = Group._defaults["fg"]
	end

	if not bg then
		bg = Group._defaults["bg"]
	end

	if not guisp then
		guisp = Group._defaults["guisp"]
	end

	if not style then
		style = Group._defaults["style"]
	end

	local obj = setmetatable({
		-- define "colorbuddy" type of "group"
		__type__ = "group",

		-- it should not be set to a "default" highlight unless set by Group.default
		__default__ = default or false,

		name = name,
		fg = fg,
		bg = bg,
		style = style,
		guisp = guisp,
		blend = blend,
	}, Group)

	groups[name] = obj

	-- send neovim our updated group
	Group.apply(obj)

	return obj
end

Group.default = function(name, fg, bg, style, guisp, blend)
	return Group.__private_create(name, fg, bg, style, guisp, blend, true)
end

Group.new = function(name, fg, bg, style, guisp, blend)
	return Group.__private_create(name, fg, bg, style, guisp, blend, false)
end

Group.override = function(name, group, opts)
	vim.validate({
		name = { name, "string" },
		group = {
			group,
			function(arg)
				if not is_group_object(arg) then
					return false, "Bad group: " .. debug.traceback()
				end
				return true
			end,
		},
		opts = {
			opts,
			"table",
		},
	})

	return Group.__private_create(
		name or group.name,
		opts.fg or group.fg,
		opts.bg or group.bg,
		opts.style or group.style,
		opts.guisp or group.guisp,
		opts.blend or group.blend,
		false
	)
end

Group.link = function(name, linked_group)
	vim.validate({
		name = { name, "string" },
		linked_group = {
			linked_group,
			function(arg)
				if not is_group_object(arg) then
					return false, "Bad group: " .. debug.traceback()
				end
				return true
			end,
		},
	})

	vim.api.nvim_set_hl(0, name, {
		link = linked_group.name,
	})
end

function Group:apply()
	--[[

  guifg={color-name}                  *highlight-guifg*
  guibg={color-name}                  *highlight-guibg*
  guisp={color-name}                  *highlight-guisp*
      These give the foreground (guifg), background (guibg) and special
      (guisp) color to use in the GUI.  "guisp" is used for undercurl
      and underline.
      There are a few special names:
          NONE        no color (transparent)
          bg      use normal background color
          background  use normal background color
          fg      use normal foreground color
          foreground  use normal foreground color
      To use a color name with an embedded space or other special character,
      put it in single quotes.  The single quote cannot be used then.
      Example: >
          :hi comment guifg='salmon pink'
  --]]

	if not self.blend then
		self.blend = 0
	end

	-- set highlight on ns 0 which means globally.
	vim.api.nvim_set_hl(
		0,
		self.name,
		vim.tbl_extend("error", {
			fg = self.fg:to_rgb(),
			bg = self.bg:to_rgb(),
			sp = self.guisp:to_rgb(),
			blend = self.blend,
			default = self.__default__,
		}, self.style.values)
	)
end

local _clear_groups = function()
	_group_hash = {}
end

return {
	groups = groups,
	Group = Group,
	is_group_object = is_group_object,
	_clear_groups = _clear_groups,
}
