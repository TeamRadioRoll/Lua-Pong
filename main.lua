function love.load()
  --Making MostImportant Variables

  Player1 = {Cordsx = -350, Cordsy = 0, Width = 16, Height = 64}
  Player2 = {Cordsx = 350, Cordsy = 0,Width = 16, Height = 64}
  AiMode = 0

  --Defining the center of the game field
  OriginPointX, OriginPointY = love.graphics.getPixelDimensions()
  OriginPointX = OriginPointX / 2
  OriginPointY = OriginPointY / 2
end

function love.update(dt)
  --KeyBoard Inputs for Player 1
  if love.keyboard.isDown("w") then
    Player1.Cordsy = Player1.Cordsy - 2
  end

  if love.keyboard.isDown("s") then
    Player1.Cordsy = Player1.Cordsy + 2
  end
  if AiMode == 0 then
    if love.keyboard.isDown("up") then
      Player2.Cordsy = Player2.Cordsy -2
    end
    if love.keyboard.isDown("down") then
      Player2.Cordsy = Player2.Cordsy +2
    end
  end
end

function love.draw()
  --Makes Debug Shapes Green as they shoud never be seen ingame
  love.graphics.setColor(0, 1, 0, 1)
  --Drawing Player1
  love.graphics.rectangle("fill",OriginPointX + Player1.Cordsx,OriginPointY + Player1.Cordsy ,Player1.Width, Player1.Height)
  --Drawing Player2
  love.graphics.rectangle("fill",OriginPointX + Player2.Cordsx,OriginPointY + Player2.Cordsy ,Player2.Width, Player2.Height)
end
