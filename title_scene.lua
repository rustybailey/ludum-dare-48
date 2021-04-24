title_scene = make_scene({
  -- music = 0, -- calling music after player lands
  player_spin_sprites = {
    99,
    101,
    99,
    103
  },
  player_minecart_sprites = {
    165,
    167
  },
  player_current_sprite = 101,
  current_spin_index = 2,
  should_flip_sprite = false,
  spin_counter = 1,
  player_pos = {
    x = 10,
    y = -10
  },
  player_target_y = 96,
  has_hit_target_y = false,
  minecart = {
    pos_x = 10,
    pos_y = 96,
    is_visible = true,
  },
  player_x_dir = 1,
  minecart_anim_counter = 1,
  current_minecart_index = 1,
  is_riding_minecart = false,
  tile_sprites = {
    192,
    226,
    194,
    200,
    198,
    196,
    206,
    204,
    202,
    230,
    228
  },
  tiles = {},
  set_next_spin_sprite = function(self)
    self.spin_counter += 1
    if (self.spin_counter < 8) then return end
    self.spin_counter = 1

    if self.current_spin_index == #self.player_spin_sprites then
      self.current_spin_index = 1
    else
      self.current_spin_index += 1
    end

    self.should_flip_sprite = self.current_spin_index == 3
    self.player_current_sprite = self.player_spin_sprites[self.current_spin_index]
  end,
  ride_minecart = function(self)
    -- move right, if it hits the limit, flip sprite and start moving left
    local boundaries = {
      left = 10,
      right = 102
    }

    if self.player_pos.x > boundaries.right or self.player_pos.x < boundaries.left then
      self.player_x_dir *= -1
      self.should_flip_sprite = self.player_x_dir < 0
    end

    self.player_pos.x += (1.5 * self.player_x_dir)

    self.minecart_anim_counter += 1
    if (self.minecart_anim_counter < 8) then return end
    self.minecart_anim_counter = 1
    local sprite_index = 1
    if (self.player_current_sprite == self.player_minecart_sprites[1]) then
      sprite_index = 2
    end
    self.player_current_sprite = self.player_minecart_sprites[sprite_index]
  end,
  make_tile = function(self, o)
    local tile_sprite = random_one(self.tile_sprites)
    return {
      x = o.x,
      y = o.y,
      sprite = tile_sprite,
      flip_x = rnd(1) < 0.5,
      flip_y = rnd(1) < 0.5,
      draw = function(self)
        spr(self.sprite, self.x * 16, self.y * 16, 2, 2, self.flip_x, self.flip_y)
      end
    }
  end,
  initialize_tiles = function(self)
    for x=0,7 do
      local tile = self:make_tile({x = x, y = 7})
      add(self.tiles, tile)
    end
  end,
  init = function(self)
    sfx(10)
    self:initialize_tiles()
  end,
  update = function(self)
    if (not self.is_riding_minecart) then
      self.player_pos.y += 2
      self:set_next_spin_sprite()
    else
      self.minecart.is_visible = false
      self:ride_minecart()
    end

    if (self.player_pos.y == self.player_target_y and not self.is_riding_minecart) then
      music(0)
      self.is_riding_minecart = true
    end

    if self.is_riding_minecart then
      if btnp(4) or btnp(5) then
        change_scene(game_scene)
      end
    end
  end,
  draw = function(self)
    cls()

    -- draw player
    spr(self.player_current_sprite, self.player_pos.x, self.player_pos.y, 2, 2, self.should_flip_sprite)

    -- draw minecart
    if self.minecart.is_visible then
      spr(163, 10, 96, 2, 2)
    end

    -- draw ground
    for i=1,#self.tiles do
      self.tiles[i]:draw()
    end

    -- draw title once player is riding minecart
    if self.is_riding_minecart then
      -- todo: design actual logo sprite
      center_print("dig it!", 40, 10)

      -- todo: blink text
      center_print("press z or x to start", screen_width / 2, 7)
    end
  end
})
