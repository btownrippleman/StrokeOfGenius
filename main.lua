-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local bg = display.newRect(0,0,display.contentWidth*2,display.contentHeight*2+90)
bg:setFillColor(0,0,0)


function fadingCircle(x,y,rad,strokeWidth,color)
 local colors = {1,0,1}
  local    colors = color --{color[1]-a*math.random(),color[3]-b*math.random(),color[3]-c*math.random()}
        local xval = x+strokeWidth*math.random()
        local yval = y+strokeWidth*math.random()
        local radius = rad * math.random()*math.random()*math.random()

        local circle = display.newCircle(xval,yval,radius)
        -- circle.alpha =  radius/rad
        colors[2] = (1-radius/rad)*(1-radius/rad)*(1-radius/rad)
        circle:setFillColor(unpack(colors))
        local options =
        {
          time = colors[2]*6*1500*math.random(),
         alpha = 0,
         onComplete = remove,
         easing= outInExpo
         }
        transition.to(circle,options)

end

function remove(obj)
  obj:removeSelf()
end

function randomFunction(ev)

end

function touched(event)

  local color = {1,0,1}
  local radius = 25
  local strokeWidth = 66

  if event.phase == "moved" then
    for i = 1,11 do
      fadingCircle(event.x,event.y,radius,strokeWidth,color)
      if math.random() < .002 then randomFunction(event) end
    end

end
end


bg:addEventListener("touch",touched)
