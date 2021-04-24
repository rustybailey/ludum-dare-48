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
    x = 3,
    y = 0,
    pos = vector{3,0},
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
  dirt = {
    rarity = 150,
    strength = 1,
    color = 4,
    sprites = {
      192
    }
  },
  gravel = {
    rarity = 40,
    strength = 2,
    color = 6,
    sprites = {
      226,
      194
    }
  },
  rock = {
    rarity = 40,
    strength = 3,
    color = 5,
    sprites = {
      200,
      198,
      196
    }
  },
  rock_gold = {
    gold_amount = 15,
    rarity = 10,
    strength = 3,
    color = 10,
    sprites = {
      206,
      204,
      202
    }
  },
  gravel_gold = {
    gold_amount = 10,
    rarity = 5,
    strength = 2,
    color = 10,
    sprites = {
      230,
      228
    }
  }
}

debug_rarity = false
rarity_called = false
function choose_tile()
  if (debug_rarity and rarity_called) then
    return tiles.dirt
  end

  local total_rarity = 0
  
  for k, tile in pairs(tiles) do
    total_rarity += tile.rarity
  end

  percent_remaing = 100
  for k, tile in pairs(tiles) do
    local tile_occurence_percent = (tile.rarity / total_rarity) * 100
    tile.roll_hit = 100 - percent_remaing + tile_occurence_percent
    percent_remaing -= tile_occurence_percent
    if (debug_rarity) then
      printh(k..".) rarity: "..tile.rarity..", roll_hit:"..tile.roll_hit..", rem:"..percent_remaing)
    end
  end

  local roll = rnd(100)

  local lowest_roll_hit = 100
  local current_tile = tiles.dirt
  for k, tile in pairs(tiles) do
    if (roll <= tile.roll_hit and tile.roll_hit < lowest_roll_hit) then
      current_tile = tile
      lowest_roll_hit = tile.roll_hit
    end
  end

  rarity_called = true
  return current_tile
end

function make_tile(o)
  local tile = choose_tile()
  return {
    strength = tile.strength,
    x = o.x,
    y = o.y,
    color = tile.color,
    sprites = tile.sprites,
    flip_x = rnd(1) < 0.5,
    flip_y = rnd(1) < 0.5,
    gold_amount = tile.gold_amount,
    draw = function(self)
      spr(self.sprites[flr(self.strength)], self.x * 16, self.y * 16, 2, 2, self.flip_x, self.flip_y)
      if(show_coordinates) then
        print(self.x..","..self.y, self.x * 16, self.y * 16, 8)
      end
    end
  }
end

tiles_below = 4

game_scene = make_scene({
  music = 4,
  init = function(self)
    self.player = make_player()
    self.tile_map = {}
    self.count_down = 100
    self.frame=1
    self.gold_amount = 0

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
        if (hit_tile.gold_amount) then
          self.gold_amount += hit_tile.gold_amount
        end
        self:remove(hit_tile)
        self.tile_map[x][y] = nil
      end
    end
    if (hit_tile) then
      self.player:dig(x,y)
      local dust_y = y * 16
      if (hit_tile.strength <= 0) then
        dust_y += 16
      end
      make_dust(self, x * 16 + 8, dust_y, hit_tile.color)
    end

    if (hit_tile == nil or hit_tile.strength <= 0) then
      self.player:move(x,y)
    end
  end,
  update = function(self)
    self.frame += 1
    self.frame = self.frame % 60
    if (self.frame == 0) then
      self.count_down -= 1
    end
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
    rectfill(0,0,screen_width, 16, 0)

    print("meters", 2,2, 7)
    print(self.player.y, 2,9, 7)

    local gold_x = (6*4) + 8
    spr(154,gold_x,2)
    print(self.gold_amount, gold_x+7,2, 7)

    local count_down_offset = (2 * 4)
    if (self.count_down >= 100) then
      count_down_offset += 4
    end
    print('time', screen_width - (4 * 4) - 1,2, 7)
    print(self.count_down, screen_width - count_down_offset - 1,9, 7)
  end
})
