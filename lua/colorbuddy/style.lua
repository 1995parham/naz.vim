local Styles = {}

function Styles:new()
	local o = {
		hash = {},
	}
	setmetatable(o, self)

	return o
end

function Styles:__index(name)
	if self.hash[string.lower(name)] ~= nil then
		return self.hash[string.lower(name)]
	end

	return Styles[name]
end

function Styles:append(style, name)
	self.hash[name or style.name] = style
end

local styles = Styles:new()

local Style = {
	__type__ = "style",
}

function Style:__tostring()
	local name = self.name
	if #name == 0 then
		name = "none"
	end

	return string.format("style:<%s>", name)
end

function Style:__add(right)
	local values = {}

	for name, _ in pairs(self.values) do
		values[name] = true
	end

	for name, _ in pairs(right.values) do
		values[name] = true
	end

	return self:new(values)
end

function Style:__sub(right)
	local values = {}

	for name, _ in pairs(self.values) do
		values[name] = true
	end

	for name, _ in pairs(right.values) do
		values[name] = nil
	end

	return self:new(values)
end

function Style:new(style)
	local values = {}

	if type(style) == "string" then
		style = string.lower(style)

		if style ~= "none" then
			values[style] = true
		end
	elseif type(values) == "table" and #values >= 0 then
		for _, s in ipairs(values) do
			-- none cannot be used in non-singular style creation
			if string.lower(s) ~= "none" then
				values[string.lower(s)] = true
			end
		end
	else
		error(string.format("style should be style(s) name but %s", style))
	end

	local obj = {
		name = table.concat(vim.tbl_keys(values), ","),
		values = values,
	}

	setmetatable(obj, self)
	self.__index = self

	-- stores only singular styles
	if type(style) == "string" then
		if style == "none" then
			styles:append(obj, style)
		else
			styles:append(obj)
		end
	end

	return obj
end

local is_style_object = function(s)
	if s == nil then
		return false
	end

	return s.__type__ == "style"
end

-- setup the valid styles for vim and then lock down "styles"
Style:new("bold")
Style:new("underline")
Style:new("undercurl")
Style:new("strikethrough")
Style:new("reverse")
Style:new("inverse")
Style:new("italic")
Style:new("standout")
Style:new("nocombine")
Style:new("NONE")

return {
	styles = styles,
	is_style_object = is_style_object,
}
