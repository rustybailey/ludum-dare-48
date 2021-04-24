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

local tiles = {
  {
    type = 'dirt',
    sprite = 192
  },
  {
    type = 'gravel',
    sprite = 194
  },
  {
    type = 'rock',
    sprite = 196
  }
}

function make_tile(o)
  local tile = random_one(tiles)
  return {
    x = o.x,
    y = o.y,
    sprite = tile.sprite,
    draw = function(self)
      spr(self.sprite, self.x, self.y, 2, 2)
    end
  }
end

local tile_map = {}

game_scene = make_scene({
  music = 1,
  init = function(self)
    self.player = make_player()

    for i=0,7 do
      for j=0,4 do 
        local tile = make_tile({x = i*16, y = 16+ j*16})
        self:add(tile)
      end
    end

    self:add(self.player)
  end,
  update = function(self)
  end,
  draw = function(self)
    camera(0, self.player.y - 48)
    cls(2)
  end
})
