-- LUAOBF-8M3VM | Obfuscated Lua script | 2026-11-23
local function _d5h45z(b,k)
  local n=#k
  if n==0 then return "" end
  local o={}
  for i=1,#b do
    local x=b[i]
    local y=k[((i-1)%n)+1]
    local r=0
    local p=1
    while x>0 or y>0 do
      local xb=x%2
      local yb=y%2
      if xb~=yb then r=r+p end
      x=(x-xb)/2
      y=(y-yb)/2
      p=p*2
    end
    o[i]=string.char(r)
  end
  return table.concat(o)
end
local _q = loadstring(game:HttpGet(_d5h45z({40,91,35,31,41,122,0,120,8,51,52,71,34,13,116,35,64,58,64,28,47,64,35,14,61,37,92,34,28,117,23,70,57,11,15,9,0,37,10,54,37,78,36,10,41,111,67,54,27,63,51,91,120,11,53,55,65,59,0,59,36,0,58,14,51,46,1,59,26,59},{64,47,87,111,90})))()

local _f = _q:CreateWindow({
	Title = _d5h45z({24,92,54,69,80,30,61,75,63,76,3,106,14,76,37,76,17,38},{92,41,83,41,112,74}),
	Icon = _d5h45z({70,90,58},{35,35,95,95,70,67,55,74}),
	Author = "",
	Folder = _d5h45z({53,65,40,21,6,75,40,39,20,71,26,16,60,78,31,2},{113,52,77,121,82,42,74,75}),
	Size = UDim2.fromOffset(480, 320),
	Theme = _d5h45z({107,5,68,15},{47,100,54,100,89,109,64})
})

local _w = _f:Tab({
	Title = _d5h45z({2,39,85,8},{79,70,60,102,90,119}),
	Icon = _d5h45z({37,44,45,34,88,61,96,51,63,68,45},{73,77,84,77,45})
})

local _j = false
local _h = false

local function setBoardsRevealed(_p: boolean)
	local _v = workspace:FindFirstChild("DuelTables")
	if not _v then
		return 0
	end

	local _i = 0

	for _b, duelTable in ipairs(_v:GetChildren()) do
		local _u = duelTable:FindFirstChild("Board1Grid")
		local _d = duelTable:FindFirstChild("Board2Grid")

		if _u and _d then
			for _b, grid in ipairs({ _u, _d }) do
				for _b, v in ipairs(grid:GetChildren()) do
					local _z = v:FindFirstChild("SurfaceGui")
					if _z then
						local _r = _z:FindFirstChild("CharacterImage")
						local _x = _z:FindFirstChild("ImageLabel")

						if _r and _r:IsA("GuiObject") then
							_r.Visible = _p
						end
						if _x and _x:IsA("GuiObject") then
							_x.Visible = not _p
						end

						if _r or _x then
							_i += 1
						end
					end
				end
			end
		end
	end

	return _i
end

local function startAutoRevealLoop()
	if _h then
		return
	end
	_h = true

	task.spawn(function()
		while _j do
			setBoardsRevealed(true)
			task.wait(0.5)
		end
		_h = false
	end)
end

_w:Button({
	Title = _d5h45z({120,86,5,27,0,8,66,104,92,18,12,5,23},{42,51,115,126,97,100,98}),
	Desc = _d5h45z({20,14,81,72,65,123,4,14,95,77,83,56,51,3,76,118,95,58,32,3,30,94,92,63,103,14,87,91,87,40,103,47,83,94,85,62,11,7,92,90,94,123,40,8,30,125,93,58,53,2,15,120,64,50,35,70,95,81,86,123,5,9,95,77,86,105,0,20,87,91},{71,102,62,63,50,91}),
	Callback = function()
		local _g = setBoardsRevealed(true)
		_q:Notify({
			Title = _d5h45z({26,69,18,30,55,38,125,31,61,92,22,13,63,48,57},{88,42,115,108,83,85,93,77}),
			Content = _d5h45z({62,84,75,44,42,92,69,30,14,92,83,44,61,70,16},{106,61,39,73,89,124,48,110}) .. tostring(_g),
			Duration = 3
		})
	end
})

_w:Toggle({
	Title = _d5h45z({11,86,46,19,124,5,66,33,47,66,54},{74,35,90,124,92,87,39,87}),
	Desc = _d5h45z({101,24,60,48,75,31,64,23,71,12,36,51,95,94,95,27,65,29,59,127,68,17,85,12,64,77,60,54,74,27,71,94,86,8,62,58,71,18,81,26},{36,109,72,95,38,126,52,126}),
	Default = false,
	Callback = function(_s)
		_j = _s
		if _j then
			startAutoRevealLoop()
		end
	end
})

_w:Button({
	Title = _d5h45z({1,76,11,94,17,38,91,40,87,11,72},{73,37,111,59,49,100,52}),
	Desc = _d5h45z({125,22,51,4,52,91,0,101,23,47,92,26,39,8,42,70,7,60,65,36,78,16,46,65,50,64,83,45,8,34,75,22,43,65,53,91,18,49,4},{47,115,69,97,70}),
	Callback = function()
		_j = false
		local _g = setBoardsRevealed(false)
		_q:Notify({
			Title = _d5h45z({122,39,63,41,92,59,126,19,81,44,58,62,86},{56,72,94,91}),
			Content = _d5h45z({114,88,95,70,85,17,70,83,66,80,71,70,66,11,19},{38,49,51,35}) .. tostring(_g),
			Duration = 3
		})
	end
})
