show_coordinates = false

function make_player()
  return {
    x = 0,
    y = 0,
    dx = 0,
    dy = 0,
    strength = 1,
    init = function(self)
    end,
    move = function(self, x, y)
      self.x = x
      self.y = y
    end,
    draw = function(self)
      spr(1, self.x * 16, self.y * 16, 2, 2)
      if(show_coordinates) then
        print(self.x..","..self.y, self.x * 16, self.y * 16, 8)
      end
    end
  }
end

local tiles = {
  {
    strength = 1,
    type = 'dirt',
    sprite = 192
  },
  {
    strength = 2,
    type = 'gravel',
    sprite = 194
  },
  {
    strength = 3,
    type = 'rock',
    sprite = 196
  }
}

function make_tile(o)
  local tile = random_one(tiles)
  return {
    strength = tile.strength,
    x = o.x,
    y = o.y,
    sprite = tile.sprite,
    draw = function(self)
      spr(self.sprite, self.x * 16, self.y * 16, 2, 2)
      if(show_coordinates) then
        print(self.x..","..self.y, self.x * 16, self.y * 16, 8)
      end
    end
  }
end


tiles_below = 5

game_scene = make_scene({
  music = 1,
  init = function(self)
    self.player = make_player()
    self.tile_map = {}

    for x=0,7 do
      for y=1,tiles_below do
        if (self.tile_map[x] == nil) then
          self.tile_map[x] = {}
        end
        local tile = make_tile({x = x, y = y})
        self.tile_map[x][y] = tile
        self:add(tile)
        self.last_tile_placed = tile
      end
    end

    self:add(self.player)
  end,
  try_move = function(self, x, y)
    local hit_tile = self.tile_map[x][y]
    if (hit_tile) then
      hit_tile.strength -= self.player.strength
      if (hit_tile.strength <= 0) then
        self:remove(hit_tile)
        self.tile_map[x][y] = nil
      end
    end
    if (hit_tile) then
      if (hit_tile.strength <= 0) then
        make_dust(self, x * 16 + 8, y * 16 + 16)
      else
        make_dust(self, x * 16 + 8, y * 16)
      end
    end
    
    if (hit_tile == nil or hit_tile.strength <= 0) then
      self.player:move(x,y)
    end
  end,
  update = function(self)
    if (btnp(1) and self.player.x < 7) then
      self:try_move(self.player.x + 1, self.player.y)
    elseif (btnp(0) and self.player.x > 0) then
      self:try_move(self.player.x - 1, self.player.y)
    elseif (btnp(3)) then
      self:try_move(self.player.x, self.player.y + 1)
    end

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
    cls(0)
    camera(0, (self.player.y * 16) - (8 - tiles_below - 1) * 16)
  end,
  after_draw = function(self)
    self.player:draw()
    camera(0,0)
    print(self.player.y, 2,2, 11)
  end
})
