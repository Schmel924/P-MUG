local Path = string.sub(..., 1, string.len(...) - string.len(".api.drawerbase"))
local Class = require(Path..".third-party.middleclass")

local DBase = Class("drawer.base") DBase.PMUGD = true --P-Mug Drawer Class

function DBase:initialize()
  self.LShapes = {} --The linked shapes.
end

function DBase:getName()
  return "base"
end

function DBase:linkShape(shp)
  if not shp.PMUGS then return error("This isn't a P-Mug shape class") end
  table.insert(self.LShapes,shp)
  return #self.LShapes
end

function DBase:draw()
  for i=1,#self.LShapes do
    local S = self.LShapes[i]
    local T = S:getDType()
    if self["draw_"..T] then self["draw_"..T](self,S) end
  end
end

function DBase:update(dt)

end

return DBase