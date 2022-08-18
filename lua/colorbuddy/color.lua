local util = require("colorbuddy.util")

local Color

local color_hash = {}
local function add_color(c)
	color_hash[string.lower(c.name)] = c
end

local function is_existing_color(raw_key)
	return color_hash[string.lower(raw_key)] ~= nil
end

local find_color = function(_, raw_key)
	local key = string.lower(raw_key)

	if is_existing_color(key) then
		return color_hash[key]
	else
		local nvim_color = vim.api.nvim_get_color_by_name(key)
		if nvim_color > 0 then
			return Color.new(key, "#" .. bit.tohex(nvim_color, 6))
		end

		return {}
	end
end

local colors = {}
-- colors.__index = colors

local next_color = function(tbl)
	local stateless_iterator = function(tbl, k)
		local v
		k, v = next(color_hash, k)

		if k == "none" then
			k, v = next(color_hash, k)
		end

		while k and string.find(k, "__") == 1 do
			k, v = next(color_hash, k)
		end

		if v ~= nil then
			return k, v
		end
	end

	return stateless_iterator, tbl, nil
end

local __colors_mt = {
	__index = find_color,
	__pairs = next_color,
	-- __pairs = function(tbl)
	--     assert(false)
	-- end,

	-- __ipairs = function(tbl)
	--     assert(false)
	-- end
}
colors = setmetatable(colors, __colors_mt)

Color = {}

local IndexColor = function(_, key)
	if Color[key] ~= nil then
		return Color[key]
	end

	return nil
end

local __ColorMt = {
	__type__ = "color",
	__metatable = {},
	__index = IndexColor,
	__tostring = function(self)
		return string.format("[%s: (%s, %s, %s)]", self.name, self.H, self.S, self.L)
	end,
}

Color.__private_create = function(name, H, S, L)
	return setmetatable({
		__type__ = "color",
		name = name,
		H = H,
		S = S,
		L = L,
	}, __ColorMt)
end

Color.new = function(name, clr)
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

	assert(__ColorMt)

	if clr == nil then
		local obj = {
			__type__ = "color",
			name = name,
			to_rgb = Color.to_rgb,
		}

		add_color(obj)

		return obj
	end

	local H, S, L = util.rgb_string_to_hsl(clr)

	-- if you have already defined that color you will get an error
	if is_existing_color(name) then
		error(string.format("color %s already defined", name))
	end

	local object = Color.__private_create(name, H, S, L)
	add_color(object)

	return object
end

local special_colors = {
	none = "none",
	bg = "bg",
	background = "background",
	fg = "fg",
	foreground = "foreground",
}

Color.to_rgb = function(self, H, S, L)
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

local _clear_colors = function()
	color_hash = {}
end

Color.new("none")
Color.new("gray0", "#282c34")
Color.new("gray1", "#282a2e")
Color.new("gray2", "#373b41")
Color.new("gray3", "#969896")
Color.new("gray4", "#b4b7b4")
Color.new("gray5", "#c5c8c6")
Color.new("gray6", "#e0e0e0")
Color.new("gray7", "#ffffff")

return {
	colors = colors,
	Color = Color,
	is_color_object = is_color_object,
	_clear_colors = _clear_colors,
}
