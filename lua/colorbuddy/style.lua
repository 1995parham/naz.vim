local __local_mt

local style_hash = {}
local find_style = function(_, name)
	if style_hash[string.lower(name)] ~= nil then
		return style_hash[string.lower(name)]
	end

	return {}
end

local styles = {}
local __styles_mt = {
	__metatable = {},
	__index = find_style,
}
setmetatable(styles, __styles_mt)

local style_tostring = function(self)
	return string.format("style:<%s>", self.name)
end

local private_create = function(values)
	return setmetatable({
		__type__ = "style",
		name = table.concat(vim.tbl_keys(values), ","),
		values = values,
	}, __local_mt)
end

local style_add = function(left, right)
	local values = {}
	for index, _ in pairs(left.values) do
		values[index] = true
	end

	for index, _ in pairs(right.values) do
		values[index] = true
	end

	return private_create(values)
end

-- style.foo - style.bar
-- Should just remove style.bar from the set of style.foo
local style_sub = function(left, right)
	local values = {}

	-- copy original set
	for index, _ in pairs(left.values) do
		values[index] = true
	end

	-- remove subtracted items
	for index, _ in pairs(right.values) do
		values[index] = nil
	end

	return private_create(values)
end

local Style = {}
__local_mt = {
	__metatable = {},
	__index = Style,
	__tostring = style_tostring,
	__add = style_add,
	__sub = style_sub,
}

Style.new = function(name)
	name = string.lower(name)

	local obj
	if name ~= "none" then
		obj = private_create({ [name] = true })
	else
		obj = private_create({})
	end

	style_hash[name] = obj

	return obj
end

local is_style_object = function(s)
	if s == nil then
		return false
	end

	return s.__type__ == "style"
end

-- setup the valid styles for vim and then lock down "styles"
Style.new("bold")
Style.new("underline")
Style.new("undercurl")
Style.new("strikethrough")
Style.new("reverse")
Style.new("inverse")
Style.new("italic")
Style.new("standout")
Style.new("nocombine")
Style.new("NONE")

-- Make styles (mostly) readonly
local read_only_styles = {}
setmetatable(read_only_styles, {
	__index = find_style,
	__newindex = function(_, k, _)
		error('Attempt to modify "styles", a read-only table, with: ' .. k)
	end,
	__metatable = false,
})

return {
	styles = read_only_styles,
	is_style_object = is_style_object,
}
