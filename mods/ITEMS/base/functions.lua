--[[
	Base functions
--]]


-- Push an element onto a stack (table).
function base.push(t, x)
	t[#t+1] = x
end

