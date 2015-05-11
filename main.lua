-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local bg = display.newRect(0,0,display.contentWidth*2,display.contentHeight*2+90)
bg:setFillColor(0,0,0)


function fadingCircle(x,y,rad,strokeWidth,color)
 local a,b,c = 0,1,0;
  local    colors = color --{color[1]-a*math.random(),color[3]-b*math.random(),color[3]-c*math.random()}
        local xval = x+strokeWidth*math.random()
        local yval = y+strokeWidth*math.random()
        local radius = rad * math.random()*math.random()*math.random()

  local circle = display.newCircle(xval,yval,radius)
        circle:setFillColor(unpack(colors))
        transition.to(circle,{time = 1000, alpha = 0})

        if circle.alpha == 0 then circle:removeSelf() end

end



function touched(event)

  local color = {1,0,1}
  local radius = 7
  local strokeWidth = 20

  if event.phase == "moved" then
    for i = 1,4 do
      fadingCircle(event.x,event.y,radius,strokeWidth,color) end
    end

end


bg:addEventListener("touch",touched)







bg:addEventListener("touch",touched)
