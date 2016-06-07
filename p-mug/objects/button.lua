local Path = string.sub(..., 1, -string.len(".objects.button"))
local Class = require(Path..".third-party.middleclass")
local OBase = require(Path..".api.objectbase")
local HBase = require(Path..".api.handlerbase")


local OButton = Class("object.button",OBase)

function OButton:initialize(x,y,w,h,t)
  OBase.initialize(self)
  local PMug = require(Path)
  self.SBody = PMug.Shape.rectangle(0,0,w,h)
  self.SText = PMug.Shape.textrect(t,0,0,w,h,"center")
  self.Drawer = PMug.Drawer.material()
  self.Handler = HBase()
  self:addDrawer(self.Drawer):addHandler(self.Handler)
  self:registerShape(self.SBody):registerShape(self.SBody)
  self.Drawer:linkShape(self.SBody):linkShape(self.SText)
  self.Handler:linkShape(self.SBody):linkShape(self.SText)
  
  self:setPosition(x,y)
end

return OButton