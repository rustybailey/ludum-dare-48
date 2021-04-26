-- debug flags
debug_show_coordinates = false
debug_rarity = false

-- debug state variables
debug_rarity_called = false

-- how many tiles are below the player at all times
tiles_below = 4

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

player_sprites = {
  shovel = {
    idle = { 1, 3 },
    dig = {
      down = { 5,11 },
      right = { 9,11 },
      left = { 9,11 }
    }
  },
  pickaxe = {
    idle = { 33, 35 },
    dig = {
      down = { 39,37 },
      right = { 43,41 },
      left = { 43,41 }
    }
  },
  drill = {
    idle = { 65, 67 },
    dig = {
      down = { 69,71,69,71 },
      right = { 73,75,73,75 },
      left = { 73,75,73,75 }
    }
  },
  ruby = {
    idle = { 99 },
    dig = {
      down = { 99,101,103 },
      right = { 99,101,103 },
      left = { 99,101,103 }
    }
  },
  cart = {
    idle = { 165 },
    dig = {
      down = { 165,167 },
      right = { 165,167 },
      left = { 165,167 }
    }
  },
}

local tools = {
  shovel = {
    dig_delay = true,
    hand_tool = true,
    name = "shovel",
    strength = 1,
    toolbar_sprite = 80,
    uses = 32767
  },
  pickaxe = {
    dig_delay = true,
    hand_tool = true,
    name = "pickaxe",
    strength = 2,
    toolbar_sprite = 96,
    uses = 250
  },
  drill = {
    dig_delay = false,
    hand_tool = true,
    name = "drill",
    strength = 3,
    toolbar_sprite = 112,
    uses = 150
  },
  ruby = {
    dig_delay = false,
    hand_tool = false,
    name = "ruby",
    strength = 10,
    toolbar_sprite = 79,
    uses = 100
  },
  cart = {
    dig_delay = true,
    hand_tool = false,
    name = "cart",
    strength = 10,
    toolbar_sprite = 79,
    uses = 200
  },
}

function make_player()
  local player = {
    x = 3,
    y = 0,
    pos = vector{3,0},
    dx = 0,
    dy = 0,
    dig_counter = 0,
    flip_x = false,
    sprite = player_sprites.shovel.idle[1],
    init = function(self)
    end,
    drop_tool = function(self)
      if (self.previous_tool) then
        self.tool = self.previous_tool
        self.tool_uses = self.previous_tool_uses
        self.tool_use_percent = self.tool_uses / self.tool.uses
        self.previous_tool = nil
      else
        self:set_tool(tools.shovel)
      end
    end,
    use_tool = function(self, uses)
      self.tool_uses -= uses
      self.tool_use_percent = self.tool_uses / self.tool.uses
      if (self.tool_uses <= 0) then
        self:drop_tool()
        sfx(19)
      end
    end,
    set_tool = function(self, tool)
      if (self.tool) then
        if (self.tool.hand_tool) then
          self.previous_tool = self.tool
          self.previous_tool_uses = self.tool_uses
        end
      end
      self.tool = tool
      self.tool_uses = tool.uses
      self.tool_use_percent = 1
    end,
    dig = function(self,x,y)
      local next_pos = vector{x,y}
      self.dig_direction = vector_direction(next_pos - self.pos)
      self.digging = true
      self.dig_counter = 1
      self.dig_sprites = player_sprites[self.tool.name].dig[self.dig_direction]
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
        self.digging = false
        self.flip_x = false
        self.sprite = player_sprites[self.tool.name].idle[1]
      end
    end,
    draw = function(self)
      spr(self.sprite, self.x * 16, self.y * 16, 2, 2, self.flip_x, false)
      if(debug_show_coordinates) then
        print(self.x..","..self.y, self.x * 16, self.y * 16, 8)
      end
    end
  }
  player:set_tool(tools.shovel)
  return player
end

local tiles = {
  dirt = {
    name = 'dirt',
    make_dust = true,
    rnd_flip = true,
    rarity = 1500,
    strength = 2,
    color = 4,
    sprites = {
      224,
      192
    }
  },
  gravel = {
    name = 'gravel',
    make_dust = true,
    rnd_flip = true,
    rarity = 400,
    strength = 3,
    color = 6,
    sprites = {
      226,
      194,
      194
    }
  },
  rock = {
    name = 'rock',
    make_dust = true,
    rnd_flip = true,
    rarity = 400,
    strength = 5,
    color = 5,
    sprites = {
      200,
      200,
      198,
      196,
      196,
    }
  },
  rock_gold = {
    name = 'rock_gold',
    make_dust = true,
    rnd_flip = true,
    has_gold = true,
    gold_amounts = {
      10,10,
      20,20,20,20,
      25,25,25,
      50,50,
    },
    rarity = 50,
    strength = 5,
    color = 10,
    sprites = {
      206,
      206,
      204,
      202,
      202
    }
  },
  gravel_gold = {
    name = 'gravel_gold',
    make_dust = true,
    rnd_flip = true,
    has_gold = true,
    gold_amounts = {
      10,10,10,10,10,
      20,
      25
    },
    rarity = 75,
    strength = 3,
    color = 10,
    sprites = {
      230,
      230,
      228
    }
  },
  clock = {
    name = 'clock',
    clock_add = 10,
    rarity = 10,
    strength = 0,
    sprite = 135
  },
  pickaxe = {
    name = 'pickaxe',
    tool = tools.pickaxe,
    rarity = 10,
    strength = 0,
    sprite = 129    
  },
  drill = {
    name = 'drill',
    tool = tools.drill,
    rarity = 5,
    strength = 0,
    sprite = 131    
  },
  ruby = {
    name = 'ruby',
    tool = tools.ruby,
    rarity = 5,
    strength = 0,
    sprite = 97,
  },
  cart = {
    name = 'cart',
    tool = tools.cart,
    rarity = 5,
    strength = 0,
    sprite = 163,
  }
}

debug_tile = nil
debug_tile_returned = false

function choose_tile(playe, x, y)
  if (debug_rarity) then
    if (not debug_rarity_called) then
      debug_rarity_called = true
    else
      return tiles.dirt
    end
  end

  if (debug_tile and not debug_tile_returned) then
    debug_tile_returned = true    
    return debug_tile
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

  return current_tile
end

local gold_amount_palette = {}
gold_amount_palette[10] = { 10,9 }
gold_amount_palette[20] = { 11,3 }
gold_amount_palette[25] = { 8,7 }
gold_amount_palette[50] = { 12,7 }

function make_tile(o)
  local tile = o.tile
  if (tile == nil) then
    tile = choose_tile(o.player)
  end

  local gold_amount = nil
  if (tile.has_gold) then
    gold_amount = random_one(tile.gold_amounts)
  end

  return {
    strength = tile.strength,
    x = o.x,
    y = o.y,
    name = tile.name,
    tool = tile.tool,
    clock_add = tile.clock_add,
    make_dust = tile.make_dust,
    color = tile.color,
    sprites = tile.sprites,
    sprite = tile.sprite,
    flip_x = tile.rnd_flip and rnd(1) < 0.5,
    flip_y = tile.rnd_flip and rnd(1) < 0.5,
    gold_amount = gold_amount,
    draw = function(self)
      local sprite = self.sprite
      if (self.sprites) then
        sprite = self.sprites[flr(self.strength)]
      end

      if (self.gold_amount) then
        local palette = gold_amount_palette[self.gold_amount]
        pal(10, palette[1])
        pal(9, palette[2])
      end

      spr(sprite, self.x * 16, self.y * 16, 2, 2, self.flip_x, self.flip_y)

      if (self.gold_amount) then
        pal() -- restore default palette
      end

      if(debug_show_coordinates) then
        print(self.x..","..self.y, self.x * 16, self.y * 16, 8)
      end
    end
  }
end

game_scene = make_scene({
  music = 0,
  init = function(self)
    self.player = make_player()
    self.tile_map = {}
    self.count_down = 60
    self.frame=1
    self.gold_amount = 0
    self.times_up = false
    self.times_up_scene_change_counter = 0
    self.times_up_scene_change_delay = 60 * 2
    self.requested_move = nil
    current_depth = 0
    current_gold = 0
    score = 0

    for x=0,7 do
      self.tile_map[x] = {}
    end

    for y=1,tiles_below do
      self:add_tile_row(y)
    end

    self:add(self.player)

    self.iris = make_iris(self.player.x * 16 + 8,self.player.y*16 - 8)
  end,
  try_move = function(self)
    if (self.player.digging and self.player.tool.dig_delay) then
      return false
    end

    if (self.requested_move == nil) then
      return false
    end

    local new_pos = self.requested_move + self.player.pos
    local x = new_pos.x
    local y = new_pos.y

    self.requested_move = nil

    local hit_tile = self.tile_map[x][y]
    if (hit_tile) then
      self.player:use_tool(hit_tile.strength)
      hit_tile.strength -= self.player.tool.strength
      if (hit_tile.strength <= 0) then
        if (hit_tile.gold_amount) then
          self.gold_amount += hit_tile.gold_amount
          sfx(15)
        end

        if (hit_tile.clock_add) then
          self.count_down += hit_tile.clock_add
          sfx(16)
        end

        if (hit_tile.tool) then
          self.player:set_tool(hit_tile.tool)
          if (hit_tile.tool.name == 'cart') then
            self.cart_move_counter = 8
            self.player.cart_direction = hit_tile.cart_direction
          end
          sfx(17)
        end

        self:remove(hit_tile)
        self.tile_map[x][y] = nil
      end

      if (hit_tile.make_dust) then
        local dust_y = y * 16
        if (hit_tile.strength <= 0) then
          dust_y += 16
        end
        self.player:dig(x,y)
        sfx(random_one({0,1,2}))
        make_dust(self, x * 16 + 8, dust_y, hit_tile.color)
      end
    end

    if (hit_tile == nil or hit_tile.strength <= 0) then
      self.player:move(x,y)
    end
    return true
  end,
  setup_cart = function(self, y)
    local cart_x = 0
    local cart_direction = direction_right
    if (rnd(10) <= 5) then
      cart_x = 7
      cart_direction = direction_left
    end
    for x=0,7 do
      local existing_tile = self.tile_map[x][y]
      if (existing_tile) then
        self:remove(existing_tile)
      end
      local tile_type = tiles.rock_gold
      if (x == cart_x) then
        tile_type = tiles.cart
      end
      local tile = make_tile({x = x, y = y, tile = tile_type})
      if (tile.name == 'cart') then
        tile.cart_direction = cart_direction
      end
      self.tile_map[x][y] = tile
      self:add(tile)
    end
  end,
  add_tile_row = function(self, y)
    self.last_row_added_y = y
    for x=0,7 do
      if (self.tile_map[x][y] == nil) then
        local tile = make_tile({x = x, y = y, player = self.player})
        if (tile.name == 'cart') then
          self:setup_cart(y)
          return
        else
          self.tile_map[x][y] = tile
          self:add(tile)
        end
      end
    end
  end,
  add_tiles = function(self)
    if (self.player.y + tiles_below == self.last_row_added_y) then
      local y = self.last_row_added_y + 1
      
      self:add_tile_row(y)

      for x=0,7 do
        -- clean up tiles above the player out of view
        local tile_to_remove = self.tile_map[x][self.player.y - 3]
        self:remove(tile_to_remove)
      end
    end    
  end,
  update = function(self)
    self.iris:update()
    if (self.times_up) then
      self.times_up_scene_change_counter += 1
      if (self.times_up_scene_change_counter > self.times_up_scene_change_delay) then
        change_scene(score_scene)
      end
      return
    end
    self.frame += 1
    self.frame = self.frame % 60
    if (self.frame == 0) then
      self.count_down -= 1
      if (self.count_down <= 5 and self.count_down > 0) sfx(20)
    end
    if (self.count_down == 0) then
      self.times_up = true
      music(-1)
      sfx(18)
      return
    end

    if (btnp(1) and self.player.x < 7) then
      self.requested_move = direction_right
    elseif (btnp(0) and self.player.x > 0) then
      self.requested_move = direction_left
    elseif (btnp(3)) then
      self.requested_move = direction_down
    end

    if (self.player.tool.name == 'cart') then
      if (self.cart_move_counter == 0) then
        self.player:drop_tool()
      else
        self.requested_move = self.player.cart_direction
      end
    end

    local moved = self:try_move()

    if (moved and self.cart_move_counter and self.cart_move_counter > 0) then
      self.cart_move_counter -= 1
    end

    self:add_tiles()

    current_depth = self.player.y
    current_gold = self.gold_amount
  end,
  draw = function(self)
    cls(0)
    camera(0, (self.player.y * 16) - (8 - tiles_below - 1) * 16)
  end,
  after_draw = function(self)
    self.player:draw()
    camera(0,0)
    rectfill(0,0,screen_width, 16, 0)

    print("depth", 2,2, 7)
    print(self.player.y, 2,9, 7)
    
    local tool_x = (4*5) + 4
    spr(self.player.tool.toolbar_sprite, tool_x, 1)

    local uses_line_length = ceil(self.player.tool_use_percent * 6)

    local use_line_color = 11
    if (uses_line_length <= 1) then
      use_line_color = 8
    elseif (uses_line_length <= 3) then
      use_line_color = 10
    end
    line(tool_x, 9, tool_x + uses_line_length, 9, use_line_color)

    local gold_x = tool_x + 10
    spr(64,gold_x,1)
    print(self.gold_amount, gold_x+7,2, 7)

    local count_down_offset = (2 * 4)
    if (self.count_down >= 100) then
      count_down_offset += 4
    end
    print('time', screen_width - (4 * 4) - 1,2, 7)
    print(self.count_down, screen_width - count_down_offset - 1,9, 7)

    if (self.times_up) then
      rectfill(40, 60, 85, 72, 0)
      center_print('time\'s up!', screen_height / 2, 7)
    end

    self.iris:draw()
  end
})
