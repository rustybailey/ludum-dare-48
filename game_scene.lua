function make_player()
  return {
    x = 0,
    y = 0,
    dx = 0,
    dy = 0,
    init = function(self)
    end,
    update = function(self)
      if (btnp(1)) then
        self.dx = 16
      elseif (btnp(0)) then
        self.dx = -16
      else
        self.dx = 0
      end
      if (btnp(3)) then
        self.dy = 16
      else
        self.dy = 0
      end
      self.x += self.dx
      self.y += self.dy

      self.x = max(self.x, 0)
      self.x = min(self.x, screen_width - 16)
    end,
    draw = function(self)
      spr(1, self.x, self.y, 2, 2)
    end
  }
end

game_scene = make_scene({
  music = 1,
  init = function(self)
    local player = make_player()
    self:add(player)
  end,
  update = function(self)
  end,
  draw = function(self)
    cls(2)
  end
})
