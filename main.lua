require "player"

function love.load()
  player.load();
  local particle = love.graphics.newImage('particle.png');

  pSystem = love.graphics.newParticleSystem(particle, 32);
  pSystem:setParticleLifetime(1, 5);
  pSystem:setLinearAcceleration(-100, -100, 100, 100);
  pSystem:setSpeed(200);
  pSystem:setRotation(10, 40);
  pSystem:setColors(255, 255, 255, 255, 255, 255, 255, 0)
end

function love.draw()
  love.graphics.draw(pSystem, player.x, player.y);
  player.draw();
end

function love.update(dt)
  pSystem:update(dt);
  player.physics(dt);
  player.move(dt);
  player.collision(dt);
  player.emitP();
end
