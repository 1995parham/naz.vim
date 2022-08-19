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

local Groups = {}

function Groups:new()
	return setmetatable({
		hash = {},
	}, self)
end

function Groups:__index(key)
	local name = string.lower(key)

	if self.hash[name] ~= nil then
		return self.hash[name]
	end

	return Groups[key]
end

function Groups:is_existing(key)
	return self.hash[string.lower(key)] ~= nil
end

function Groups:__newindex(key, value)
	local name = string.lower(key)
	self.hash[name] = value
end

local groups = Groups:new()

local Group = {}

function Group:__tostring()
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

function Group:__new(name, fg, bg, style, guisp, blend, default)
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
		fg = self._defaults.fg
	end

	if not bg then
		bg = self._defaults.bg
	end

	if not guisp then
		guisp = self._defaults.guisp
	end

	if not style then
		style = self._defaults.style
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
	}, self)
	self.__index = self

	groups[name] = obj

	-- send neovim our updated group
	Group.apply(obj)

	return obj
end

function Group.default(name, fg, bg, style, guisp, blend)
	return Group:__new(name, fg, bg, style, guisp, blend, true)
end

function Group.new(name, fg, bg, style, guisp, blend)
	return Group:__new(name, fg, bg, style, guisp, blend, false)
end

function Group.override(name, group, opts)
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

	return Group:__new(
		name or group.name,
		opts.fg or group.fg,
		opts.bg or group.bg,
		opts.style or group.style,
		opts.guisp or group.guisp,
		opts.blend or group.blend,
		false
	)
end

function Group.link(name, linked_group)
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

return {
	groups = groups,
	Group = Group,
	is_group_object = is_group_object,
}
