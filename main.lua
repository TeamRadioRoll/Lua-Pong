function love.load()
  --Making MostImportant Variables

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
  --Player Data
  Player1 = {x = OriginPointX - 350, y = OriginPointY + 0, Width = 16, Height = 64}
  Player2 = {x = OriginPointX + 350, y = OriginPointY + 0,Width = 16, Height = 64}
  --Ball Data
  Ball = {x = OriginPointX,y = OriginPointY,Width = 16,Height = 16,Velocityx = -2.5,Velocityy = 0}
  ----SPACE RESERVED FOR FUNCTIONS
  function CheckInput()
    --KeyBoard Inputs for Player 1
    if love.keyboard.isDown("w") then
      Player1.y = Player1.y - 2
    end

    if love.keyboard.isDown("s") then
      Player1.y = Player1.y + 2
    end
    --Input for Player2 and only works when Ai mode is 0
    if AiMode == 0 then
      if love.keyboard.isDown("up") then
        Player2.y = Player2.y -2
      end
      if love.keyboard.isDown("down") then
        Player2.y = Player2.y +2
      end
    end
  end

  function BoundaryCheck()
    Player1.bottomcheck = Player1.y + Player1.Height
    if Player1.bottomcheck >= 600 then
      Player1.y = 600 - Player1.Height
    end
    if Player1.y <= 0 then

      Player1.y = 0

    end
    Player2.bottomcheck = Player2.y + Player1.Height
    if Player2.bottomcheck >= 600 then
      Player2.y = 600 - Player2.Height
    end
    if Player2.y <= 0 then

      Player2.y = 0

    end
    function BallPyhsics()
      Ball.y = Ball.y + Ball.Velocityy
      Ball.x = Ball.x + Ball.Velocityx
      if Ball.x >= Player1.x then


    end
  end
function CollisonCheck()
  if Player1.y  >= Ball.y and Player1.x - 64 >= Ball.x then
    Player1.x = 200
  end

end

  end

  ----SPACE RESVERED END
end

function love.update(dt)
  CheckInput()
  BoundaryCheck()
  BallPyhsics()
  CollisonCheck()

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



end
function love.draw()
  love.graphics.push()
  -- scaling Screen
  love.graphics.scale(love.graphics.getWidth() / Game.Width, love.graphics.getHeight() / Game.Height)

  --Makes Debug Shapes Green as they shoud never be seen ingame
  love.graphics.setColor(0, 1, 0, 1)

  --Drawing Player1
  love.graphics.rectangle("fill",Player1.x,Player1.y,Player1.Width, Player1.Height)

  --Drawing Player2
  love.graphics.rectangle("fill",Player2.x,Player2.y,Player2.Width, Player2.Height)

  --Drawing Ball
  love.graphics.rectangle("fill", Ball.x, Ball.y, Ball.Width, Ball.Height)
  --Poping graphics
  love.graphics.pop()
end
