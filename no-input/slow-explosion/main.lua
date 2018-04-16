function love.load()
	local img = love.graphics.newImage('particle.png')

	psystem = love.graphics.newParticleSystem(img, 64)
	psystem:setParticleLifetime(2, 5)
	psystem:setEmissionRate(10)
	psystem:setLinearAcceleration(-50, -50, 50, 50)
	psystem:setColors(255, 255, 255, 255, 255, 255, 255, 0)
end

function love.draw()
	love.graphics.draw(psystem, love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5)
end

function love.update(dt)
	psystem:update(dt)
end
