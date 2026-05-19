-- // Programming Language Inside LUAU: Selembly
-- -- (https://github.com/Phemeti/Selembly-Language)

-- // Start coding here
local main = [[
sd >>>
prD
mr
sd >>>>>>>>
prD
ml
prD
]]

local memory = {data = {selected = 1, count = 10, data = {}}, tbls = {}}

local smartvalue = function(v)
	return tonumber(v) or v
end
local resolvevalue = function(v)
	if not v then return nil end
	local ref = v:match('^%[(%d+)%]$')
	if ref then
		return memory.data.data[tonumber(ref)]
	end
	return smartvalue(v)
end
local updatedata = function()
	for i = 1, memory.data.count do
		if not memory.data.data[i] then
			memory.data.data[i] = 1
		end
	end
end
updatedata()

for line in main:gmatch('[^\n]+') do
	local args = {}
	local i = 1
	while i <= #line do
		local _, we = line:find('^%s+', i)
		if we then i = we + 1 end
		if i > #line then break end
		if line:sub(i, i) == '"' then
			local _, qe, cap = line:find('^"([^"]*)"', i)
			if cap then
				table.insert(args, cap)
				i = qe + 1
			else
				i = i + 1
			end
		else
			local _, pe, cap = line:find('^(%S+)', i)
			if cap then
				table.insert(args, cap)
				i = pe + 1
			else
				break
			end
		end
	end
	if not args[1] then continue end
	-- // create data
	if args[1] == 'cd' then
		memory.data.count = tonumber(args[2])
		updatedata()
	-- // move left
	elseif args[1] == 'ml' then
		memory.data.selected -= 1
		if memory.data.selected < 1 then
			memory.data.selected = memory.data.count
		elseif memory.data.selected > memory.data.count then
			memory.data.selected = 1
		end
	-- // move right
	elseif args[1] == 'mr' then
		memory.data.selected += 1
		if memory.data.selected < 1 then
			memory.data.selected = memory.data.count
		elseif memory.data.selected > memory.data.count then
			memory.data.selected = 1
		end
	-- // set data
	elseif args[1] == 'sd' then
		if args[2] then
			local v = memory.data.selected
			if args[2]:match('^[<>]+$') then
				local net = 0
				for c in args[2]:gmatch('.') do
					if c == '>' then net += 1
					elseif c == '<' then net -= 1
					end
				end
				memory.data.data[v] = (memory.data.data[v] or 1) + net
			else
				memory.data.data[v] = resolvevalue(args[2])
			end
		end
	-- // print data
	elseif args[1] == 'prD' then
		print(memory.data.data[memory.data.selected])
	-- // print selection
	elseif args[1] == 'prS' then
		print(memory.data.selected)
	-- // reset selection
	elseif args[1] == 'rs' then
		memory.data.selected = 1
	-- // clear data
	elseif args[1] == 'cld' then
		for i = 1, #memory.data.data do
			memory.data.data[i] = 1
		end
	-- // new data table
	elseif args[1] == 'ndt' then
		if args[2] then
			memory.tbls[args[2]] = {}
		end
	-- // create data key
	elseif args[1] == 'cdk' then
		if args[2] and args[3] then
			memory.tbls[args[2]][args[3]] = 1
		end
	-- // set data key
	elseif args[1] == 'sdk' then
		if args[2] and args[3] and args[4] then
			memory.tbls[args[2]][args[3]] = resolvevalue(args[4])
		end
	-- // print data key
	elseif args[1] == 'prDK' then
		if args[2] and args[3] then
			print(memory.tbls[args[2]][args[3]])
		end
	end
end
