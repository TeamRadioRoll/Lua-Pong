function love.load()
  --Making MostImportant Variables

  Player1 = {Cordsx = 0, Cordsy = 0}

  --Defining the center of the game field
  OriginPointX, OriginPointY = love.graphics.getPixelDimensions()
  OriginPointX = OriginPointX / 2
  OriginPointY = OriginPointY / 2
end

function love.update(dt)


end

function love.draw()
  --Makes Debug Shapes Green as they shoud never be seen ingame
  love.graphics.setColor(0, 1, 0, 1)

  love.graphics.rectangle("fill",OriginPointX ,OriginPointY.Cordsy + Player1.Cordsx , 100, 100)
end
