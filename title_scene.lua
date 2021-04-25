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
  player_pos = {
    x = 10,
    y = -10
  },
  player_target_y = 96,
  tile_sprites = {
    192,
    194,
    196,
    202,
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
    self.player_x_dir = 1
    self.start_game_text_blink = 1
    self.minecart_anim_counter = 1
    self.current_minecart_index = 1
    self.is_riding_minecart = false
    self.has_hit_target_y = false
    self.minecart_is_visible = false
    self.player_current_sprite = 101
    self.current_spin_index = 2
    self.should_flip_sprite = false
    self.spin_counter = 1
    self.player_pos.y = -10

    sfx(10)
    self:initialize_tiles()
  end,
  update = function(self)
    if (not self.is_riding_minecart) then
      self.player_pos.y += 2
      self:set_next_spin_sprite()
    else
      self.minecart_is_visible = false
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

      self.start_game_text_blink += 1
      if self.start_game_text_blink > 60 then self.start_game_text_blink = 1 end
    end
  end,
  draw = function(self)
    cls()

    -- draw player
    spr(self.player_current_sprite, self.player_pos.x, self.player_pos.y, 2, 2, self.should_flip_sprite)

    -- draw minecart
    if self.minecart_is_visible then
      spr(163, 10, 96, 2, 2)
    end

    -- draw ground
    for i=1,#self.tiles do
      self.tiles[i]:draw()
    end

    -- draw title once player is riding minecart
    if self.is_riding_minecart then
      local logo_x = 40
      local logo_y = 25
      local second_text_offset = 19
      spr(137, logo_x, logo_y, 8, 2)
      spr(169, 43, logo_y + second_text_offset, 4, 2)
      spr(173, 72, logo_y + second_text_offset, 2, 2)

      if self.start_game_text_blink > 30 then
        center_print("press z or x to start", 74, 7)
      end
    end
  end
})
