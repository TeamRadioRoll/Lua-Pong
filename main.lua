function love.load()
  --Making MostImportant Variables
  Player1 = {Cordsx = -350, Cordsy = 0, Width = 16, Height = 64}
  Player2 = {Cordsx = 350, Cordsy = 0,Width = 16, Height = 64}
  AiMode = 0

  Game = {}
  Game.Width = 800
  Game.Height = 600
  Game.FullScreen = false
  Game.NegWidth = Game.Width * -1
  Game.Negheight = Game.Height * -1

  --Defining the center of the game field
  OriginPointX = Game.Width / 2
  OriginPointY = Game.Height / 2
  ----SPACE RESERVED FOR FUNCTIONS
  function CheckInput()
    --KeyBoard Inputs for Player 1
    if love.keyboard.isDown("w") then
      Player1.Cordsy = Player1.Cordsy - 2
    end

    if love.keyboard.isDown("s") then
      Player1.Cordsy = Player1.Cordsy + 2
    end
    --Input for Player2 and only works when Ai mode is 0
    if AiMode == 0 then
      if love.keyboard.isDown("up") then
        Player2.Cordsy = Player2.Cordsy -2
      end
      if love.keyboard.isDown("down") then
        Player2.Cordsy = Player2.Cordsy +2
      end
    end
  end





  ----SPACE RESVERED END
end

function love.update(dt)
  CheckInput()

  function love.keypressed( key, scancode, isrepeat )
    if key == "escape" then
      if Game.FullScreen == true then
       love.window.setFullscreen(false, "desktop")
       Game.FullScreen = false
    else
        love.window.setFullscreen(true, "desktop")
        Game.FullScreen = true
      end
    end
  end

-- Collsion Boundieris
  if Player1.Cordsy <= -300 then
    Player1.Cordsy = Player1.Cordsy + 2
  end
if Player1.Cordsy >= 236 then
  Player1.Cordsy = Player1.Cordsy - 2
end

if Player2.Cordsy <= -300 then
  Player2.Cordsy = Player1.Cordsy + 2
end
if Player2.Cordsy >= 236 then
Player2.Cordsy = Player1.Cordsy - 2
end

end
function love.draw()
  love.graphics.push()
  -- scaling Screen
  love.graphics.scale(love.graphics.getWidth() / Game.Width, love.graphics.getHeight() / Game.Height)

  --Makes Debug Shapes Green as they shoud never be seen ingame
  love.graphics.setColor(0, 1, 0, 1)
  love.graphics.print(Player1.Cordsy,OriginPointX,OriginPointY)

  --Drawing Player1
  love.graphics.rectangle("fill",OriginPointX + Player1.Cordsx,OriginPointY + Player1.Cordsy ,Player1.Width, Player1.Height)

  --Drawing Player2
  love.graphics.rectangle("fill",OriginPointX + Player2.Cordsx,OriginPointY + Player2.Cordsy ,Player2.Width, Player2.Height)

  --Poping graphics
  love.graphics.pop()

end
