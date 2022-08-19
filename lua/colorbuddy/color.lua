local util = require("colorbuddy.util")

local Color = {
	__type__ = "color",
}

local Colors = {}

function Colors:new()
	local o = {
		hash = {},
	}
	setmetatable(o, self)

	return o
end

function Colors:add(c)
	self.hash[string.lower(c.name)] = c
end

function Colors:is_existing(name)
	return self.hash[string.lower(name)] ~= nil
end

function Colors:__index(name)
	local key = string.lower(name)

	if Colors.is_existing(self, key) then
		return self.hash[key]
	else
		local nvim_color = vim.api.nvim_get_color_by_name(key)
		if nvim_color > 0 then
			return Color:new(key, "#" .. bit.tohex(nvim_color, 6))
		end
	end

	return Colors[name]
end

local colors = Colors:new()

function Color:__tostring()
	return string.format("[%s: (%s, %s, %s)]", self.name, self.H, self.S, self.L)
end

function Color:new(name, clr)
	vim.validate({
		name = { name, "string" },
		clr = {
			clr,
			function(arg)
				if arg == nil then
					return true
				end
				if type(arg) == "string" and arg:sub(1, 1) == "#" and arg:len() == 7 then
					return true
				end
				return false, string.format("color must be #ffffff but got %s", arg)
			end,
		},
	})

	local H, S, L

	if clr ~= nil then
		H, S, L = util.rgb_string_to_hsl(clr)
	end

	-- if you have already defined that color you will get an error
	if colors:is_existing(name) then
		error(string.format("color %s already defined", name))
	end

	local object = {
		name = name,
		H = H,
		S = S,
		L = L,
	}
	setmetatable(object, self)
	self.__index = self

	colors:add(object)

	return object
end

function Color:to_rgb(H, S, L)
	local special_colors = {
		none = "none",
		bg = "bg",
		background = "background",
		fg = "fg",
		foreground = "foreground",
	}

	if special_colors[self.name] then
		return special_colors[self.name]
	end

	if H == nil then
		H = self.H
	end
	if S == nil then
		S = self.S
	end
	if L == nil then
		L = self.L
	end

	local rgb = { util.hsl_to_rgb(H, S, L) }
	local buffer = "#"

	for _, v in ipairs(rgb) do
		buffer = buffer
			.. string.format(
				"%02x",
				util.clamp(
					-- Don't let the number be greater than 255 or less than 0
					-- 0-255 is the valid range
					math.floor(v * 256 + 0.001),
					0,
					255
				)
			)
	end

	return buffer
end

local is_color_object = function(c)
	if c == nil then
		return false
	end

	return c.__type__ == "color"
end

Color:new("none")
Color:new("gray0", "#282c34")
Color:new("gray1", "#282a2e")
Color:new("gray2", "#373b41")
Color:new("gray3", "#969896")
Color:new("gray4", "#b4b7b4")
Color:new("gray5", "#c5c8c6")
Color:new("gray6", "#e0e0e0")
Color:new("gray7", "#ffffff")

return {
	colors = colors,
	Color = Color,
	is_color_object = is_color_object,
}
