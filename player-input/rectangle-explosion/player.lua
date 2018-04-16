player = { };

function player.load()
  player.x = 10;
  player.y = 10;
  player.width = 10;
  player.height = 10;
  player.xvel = 0;
  player.yvel = 0;
  player.friction = 1;
  player.speed = 500;
end

function player.draw()
  --love.graphics.setColor(51, 51, 51);
  love.graphics.rectangle('fill', player.x, player.y, player.width, player.height);
end

function player.physics(dt)
  player.x = player.x + player.xvel * dt;
  player.y = player.y + player.yvel * dt;
  player.xvel = player.xvel * (1 - math.min(dt * player.friction, 1));
  player.yvel = player.yvel * (1 - math.min(dt * player.friction, 1));
end

function player.move(dt)
  if(love.keyboard.isDown('d')) and (player.xvel < player.speed) then
    player.xvel = player.xvel + player.speed * dt;
  end

  if(love.keyboard.isDown('a')) and (player.xvel > -player.speed) then
    player.xvel = player.xvel - player.speed * dt;
  end

  if(love.keyboard.isDown('s')) and (player.yvel < player.speed) then
    player.yvel = player.yvel + player.speed * dt;
  end

  if(love.keyboard.isDown('w')) and (player.yvel > -player.speed) then
    player.yvel = player.yvel - player.speed * dt;
  end
end

function player.collision(dt)
  if(player.x < 0) then
    player.x = 0;
    player.xvel = 0;
  end

  if(player.y < 0) then
    player.y = 0;
    player.yvel = 0;
  end

  if(player.x + player.width > love.graphics.getWidth()) then
    player.x = love.graphics.getWidth() - player.width;
    player.xvel = 0;
  end

  if(player.y + player.height > love.graphics.getHeight()) then
    player.y = love.graphics.getHeight() - player.height;
    player.yvel = 0;
  end
end

function player.emitP()
  if(player.x == 0) then
    pSystem:emit(30);
  end
end
