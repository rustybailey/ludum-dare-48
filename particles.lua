function make_dust(scene, x, y)
	local make_particle = function(x, y)
		local particle_colors = { 4,5,6, 7 }
		local particle = {
			x = x - 4 + flr(rnd(4)),
			y = y + flr(rnd(4)),
			width = 1 + flr(rnd(2)),
			color = random_one(particle_colors),
			counter = 5 + flr(rnd(8)),
			dx = flr(rnd(4)) - 2,
			dy = flr(rnd(2)) - 3,
			dwidth = flr(rnd(3)) - 1,
			update = function(self)
				self.x += self.dx
				self.y += self.dy
				self.width += self.dwidth
				self.counter -= 1
				if (self.counter <= 0) then
					scene:remove(self)
				end
			end,
			draw = function(self)
				circfill(self.x, self.y, self.width / 2, self.color)
			end
		}
		scene:add(particle)
	end
	local count = 10 + flr(rnd(10))
	for i = 0, count do
		make_particle(x, y)
	end
end



particle_scene = make_scene({
  init = function(self)
    make_dust(self, 64, 64)
  end,
  update = function(self)
  end,
  draw = function(self)
    cls()
  end
})
