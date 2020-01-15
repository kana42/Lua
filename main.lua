require('game')

function love.load()
  love.window.setPosition(500, 50, 1)
  interval = 20
  add_apple()
end

function love.draw()
  game_draw()
  if state == GameStates.game_over then -- rysowanie napisu Game Over
    love.graphics.print("Game Over!",200,300,0,4,4)
  love.graphics.print("Press Space to restart", 150, 400, 0, 3, 3)
  end
end

function love.update()
  if state == GameStates.running then
  interval=interval -1
  if interval < 0 then
    game_update()
    if tail_length<=5 then
    interval = 20
    elseif tail_length > 5 and tail_length<=10 then
      interval = 15
    elseif tail_length > 10 and tail_length<=15 then
      interval = 10
    else
      interval = 5
      end
  end
end

  
end


function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  elseif key == 'left' and state == GameStates.running then 
    left, right, up, down = true, false, false, false
  elseif key == 'right' and state == GameStates.running then 
    left, right, up, down = false, true, false, false
     elseif key == 'up' and state == GameStates.running then 
    left, right, up, down = false, false, true, false
     elseif key == 'down' and state == GameStates.running then 
    left, right, up, down = false, false, false, true
  elseif key == 'space' and state == GameStates.game_over then game_restart()
  elseif key == 'p' then if state ==GameStates.running then 
    state = GameStates.pause
  else
    state=GameStates.running
  end
  
  end
end
