title_scene = make_scene({
  music = 4, -- create title music and add here
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
  player_target_y = 100,
  has_hit_target_y = false,
  minecart = {
    pos_x = 10,
    pos_y = 100,
    is_visible = true,
  },
  player_x_dir = 1,
  minecart_anim_counter = 1,
  current_minecart_index = 1,
  is_riding_minecart = false,
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
      right = 110
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
  init = function(self)
    sfx(10)
  end,
  update = function(self)


    if (not self.is_riding_minecart) then
      self.player_pos.y += 2
      self:set_next_spin_sprite()
    else
      self.minecart.is_visible = false
      self:ride_minecart()
    end

    if (self.player_pos.y == self.player_target_y - 2) then
      music(0)
      self.is_riding_minecart = true
    end
  end,
  draw = function(self)
    cls()

    -- draw player
    spr(self.player_current_sprite, self.player_pos.x, self.player_pos.y, 2, 2, self.should_flip_sprite)

    -- draw minecart
    if self.minecart.is_visible then
      spr(163, 10, 100, 2, 2)
    end
  end
})
