-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local areafill = 0
local physics = require "physics"
physics.start()
local bg = display.newRect(0,0,display.contentWidth*2,display.contentHeight*2+90)
bg:setFillColor(0,0,0)

local leftBox = display.newRect(0,0,10,display.contentHeight*2+80)
local rightBox = display.newRect(0,0,10,display.contentHeight*2+80)
rightBox.x = display.contentWidth
local bottomBox = display.newRect(0,display.contentHeight+25,display.contentWidth*2,10)


physics.addBody(leftBox)
leftBox.bodyType = "static"
physics.addBody(rightBox)
rightBox.bodyType = "static"
physics.addBody(bottomBox)
bottomBox.bodyType = "static"

local function letterI(dx,dy,color)
     local box = display.newRect(0,0,15,75)
     box.x =  box.x +dx
     box.y =  box.y +dy
     box:setFillColor(color)

      physics.addBody(box,"static",{density = 0})
     return box
end

local function letterL(dx,dy,color)
    group  = {}
     local box = display.newRect(0,0,15,75)
     local box2 = display.newRect(0,45,15,55)
     box2:rotate(90); box2.x = box2.x + 55/2-15/2
     group[1] = box
     group[2] = box2

      physics.addBody(box,"static",{density = .01})
      physics.addBody(box2,"static",{density = .01})

      for i = 1, #group do
        group[i]:setFillColor(color)
        group[i].x = group[i].x +dx
        group[i].y = group[i].y +dy
      end
    transition.to(box,{time = 10000,density = 1})
     return group
end

local function letterO(dx,dy,color)
    circleOfRects = ellipsoidMaker(15,75/2 ,dx,dy,1,color)
end

local function letterV(dx,dy,color)
  group  = {}
   local box = display.newRect(0,0,15,90)
   local box2 = display.newRect(0,0,15,90)
   box:rotate(15)
   box.x = box.x + 25
   box2:rotate(-15); --box2.x = box2.x + 75/2-15/2
   group[1] = box
   group[2] = box2

    physics.addBody(box,"static")
    physics.addBody(box2,"static")

    for i = 1, #group do
      group[i]:setFillColor(color)
      group[i].x = group[i].x +dx
      group[i].y = group[i].y +dy
    end

   return group
end

local function letterE(dx,dy,color)
    group  = {}
     local box = display.newRect(0,0,15,75)
     local box2 = display.newRect(0,45,15,55)
     local box3 = display.newRect(0,45,15,55)
     local box4 = display.newRect(0,45,15,55)

     box2:rotate(90); box2.x = box2.x + 55/2-15/2
     box3:rotate(90); box3.x = box3.x + 55/2-15/2
     box4:rotate(90); box4.x = box4.x + 55/2-15/2

     box3.y = box3.y -75
     box4.y = box4.y -75/2

     group = {box,box2,box3,box4}

      physics.addBody(box,"static")
      physics.addBody(box2,"static")
      physics.addBody(box3,"static")
      physics.addBody(box4,"static")


      for i = 1, #group do
        group[i]:setFillColor(color)
        group[i].x = group[i].x +dx
        group[i].y = group[i].y +dy
      end

     return group
end

local function letterY(dx,dy,color)
  group  = {}
   local box = display.newRect(0,0,15,45)
   local box2 = display.newRect(0,0,15,45)
   local box3 = display.newRect(0,0,15,45)
   box3.y = box3.y + box.height
   box3.x = box3.x + box3.width

   box:rotate(15)
   box.x = box.x + 25
   box2:rotate(-15); --box2.x = box2.x + 75/2-15/2

   group = {box,box2,box3}
    physics.addBody(box,"static")
    physics.addBody(box2,"static")
    physics.addBody(box3,"static")


    for i = 1, #group do
      group[i]:setFillColor(color)
      group[i].x = group[i].x +dx
      group[i].y = group[i].y +dy
    end

   return group
end

local function letterU(dx,dy,color)
    circleOfRects = ellipsoidMaker(80,75/2 ,dx,dy,0,0,math.pi)
end

 function ellipsoidMaker(numOfCopies,distance,centerX,centerY,spacePercentage,color,angle) --- this makes an array of rects centered around target
       local rectArray = {}
        if angle == nil or angle == 0 then angle = math.pi*2 end
           for i = 1, numOfCopies, 1 do
               rectArray[i] = display.newRect(centerX,centerY,15,spacePercentage*angle*distance/numOfCopies)
               rectArray[i]:setFillColor( color )
               physics.addBody(rectArray[i],"static")
               --rectArray[i].x = rectArray[i].x+ distance
               local x = distance*.7*math.cos((i-1)*(angle/numOfCopies))
               local y = distance*math.sin((i-1)*(angle/numOfCopies))
               rectArray[i].x =  x + centerX
               rectArray[i].y =  y + centerY

            rectArray[i]:rotate((angle/(2*math.pi)*360/numOfCopies)*(i-1))--(360/numOfCopies)*i)

           end
       return rectArray
 end

local function lettersGenerator(x)
local startRow = 50;
local color = 0


    local i = letterI(160,startRow,color)


    local l = letterL(35,startRow*3,color)
    local o = letterO(115,startRow*3+7.5,color)
    local v = letterV(175,startRow*3+7.5,color)
    local e = letterE(170+70,startRow*3,color)

    local y = letterY(80,startRow*5,color)
    letterO(160,startRow*5+22,color)
    letterU(240,startRow*5+22,color)

end





function remove(obj)
  -- obj:removeSelf()
end

function fadingCircle(x,y,rad,strokeWidth,color)
   local xval = x+strokeWidth*math.random()
   local yval = y+strokeWidth*math.random()
   local radius = rad * math.random()



  local circle = display.newCircle(xval,yval,radius)
        circle:setFillColor(1,0,1)
        circle.alpha = math.random()
        physics.addBody(circle,{radius = radius,bounce =.8 })
        circle.bodyType = "dynamic"
        options = {
          time = 30000*math.random(),
          -- x = display.contentWidth/2,
          -- y= display.contentHeight/2,
          alpha = 0,
          onComplete = remove}
        --transition.to(circle,options)


end

function touched(event)

  local color = {1,0,1}
  local radius = 15
  local strokeWidth = 40

  if event.phase == "moved" then
    for i = 1,5 do
        fadingCircle(event.x,event.y,radius,strokeWidth,color)  end
     end

end

 lettersGenerator()
 -- timer.performWithDelay(18000,lettersGenerator)

bg:addEventListener("touch",touched)
