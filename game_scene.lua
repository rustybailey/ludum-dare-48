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
        self.dx = 1
      elseif (btnp(0)) then
        self.dx = -1
      else
        self.dx = 0
      end
      if (btnp(3)) then
        self.dy = 1
      else
        self.dy = 0
      end
      self.x += self.dx
      self.y += self.dy

      self.x = max(self.x, 0)
      self.x = min(self.x, screen_width - 16)
    end,
    draw = function(self)
      spr(1, self.x * 16, self.y * 16, 2, 2)
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
      spr(self.sprite, self.x * 16, self.y * 16, 2, 2)
    end
  }
end


tiles_below = 5

game_scene = make_scene({
  music = 1,
  init = function(self)
    self.player = make_player()
    self.tile_map = {}

    for i=0,7 do
      for j=0,tiles_below do
        if (self.tile_map[i] == nil) then
          self.tile_map[i] = {}
        end
        local tile = make_tile({x = i, y = 1 + j})
        self.tile_map[i][j] = tile
        self:add(tile)
        self.last_tile_placed = tile
      end
    end

    self:add(self.player)
  end,
  update = function(self)
    if (self.player.y + tiles_below == self.last_tile_placed.y) then
      local y = self.last_tile_placed.y + 1
      for x=0,7 do
        local tile = make_tile({x = x, y = y})
        self.tile_map[x][y] = tile
        self:add(tile)
        self.last_tile_placed = tile
      end
    end
  end,
  draw = function(self)
    camera(0, (self.player.y * 16) - (8 - tiles_below - 1) * 16)
    cls(2)
  end,
  after_draw = function(self)
    self.player:draw()
  end
})
