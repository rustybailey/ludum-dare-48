show_coordinates = false

direction_up = vector{0,-1}
direction_down = vector{0,1}
direction_left = vector{-1,0}
direction_right = vector{1,0}

function vector_direction(v)
  if (v == direction_down) then
    return "down"
  elseif (v == direction_right) then 
    return "right"
  elseif (v == direction_left) then
    return "left"
  elseif (v == direction_up) then
    return "up"
  end
end

dig_animation_length = 16

dig_down_sprites = {
  5,
  11
}

dig_right_sprites = {
  9,
  11
}

player_sprites = {
  idle = {
    1,
    3
  },
  dig = {
    down = dig_down_sprites,
    right = dig_right_sprites,
    left = dig_right_sprites
  }
}

function make_player()
  return {
    x = 0,
    y = 0,
    pos = vector{0,0},
    dx = 0,
    dy = 0,
    strength = 1,
    sprite = player_sprites.idle[1],
    dig_counter = 0,
    flip_x = false,
    init = function(self)
    end,
    dig = function(self,x,y)
      local next_pos = vector{x,y}
      self.dig_direction = vector_direction(next_pos - self.pos)
      self.dig_counter = 1
      self.dig_sprites = player_sprites.dig[self.dig_direction]
      if (self.dig_direction == "left") then
        self.flip_x = true
      else 
        self.flip_x = false
      end
    end,
    move = function(self, x, y)
      self.x = x
      self.y = y
      self.pos.x = x
      self.pos.y = y
    end,
    update = function(self)
      if (self.dig_counter >= 1 and self.dig_counter < dig_animation_length) then
        self.dig_counter += 1
        local ratio =  #self.dig_sprites / dig_animation_length
        local frame = max(1,ceil(ratio * self.dig_counter))
        self.sprite = self.dig_sprites[frame]
      else
        self.flip_x = false
        self.sprite = 1
      end
    end,
    draw = function(self)
      spr(self.sprite, self.x * 16, self.y * 16, 2, 2, self.flip_x, false)
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
    sprites = {
      192
    }
  },
  {
    strength = 2,
    type = 'gravel',
    sprites = {
      226,
      194
    }
  },
  {
    strength = 3,
    type = 'rock',
    sprites = {
      200,
      198,
      196
    }
  }
}

function make_tile(o)
  local tile = random_one(tiles)
  return {
    strength = tile.strength,
    x = o.x,
    y = o.y,
    sprites = tile.sprites,
    draw = function(self)
      spr(self.sprites[flr(self.strength)], self.x * 16, self.y * 16, 2, 2)
      if(show_coordinates) then
        print(self.x..","..self.y, self.x * 16, self.y * 16, 8)
      end
    end
  }
end

tiles_below = 5

game_scene = make_scene({
  music = 4,
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
      self.player:dig(x,y)
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
