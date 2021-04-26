score_scene = make_scene({
  -- music = 0,
  gold_multiplier = 5,
  depth_multiplier = 2,
  tally_score = function(self)
    while(self.gold_counter < current_gold) do
      self.gold_counter += 1
      sfx(11)
      yield()
    end

    delay(30)
    self.final_gold_score = self.gold_counter * self.gold_multiplier
    sfx(12)
    delay(30)

    while(self.depth_counter < current_meters) do
      self.depth_counter += 1
      sfx(11)
      yield()
    end

    delay(30)
    self.final_depth_score = self.depth_counter * self.depth_multiplier
    sfx(12)

    delay(60)
    self.final_total_score = self.final_gold_score + self.final_depth_score
    self.show_scores = true

    if self.final_total_score > high_score then
      self.is_new_record = true
      high_score = self.final_total_score
      music(5)
    else
      sfx(12)
    end

    delay(30)
    self.allow_restart_game = true
  end,
  init = function(self)
    self.gold_counter = 0
    self.depth_counter = 0
    self.restart_game_text_blink = 0
    self.new_record_color_index = 1
    self.show_scores = false
    self.is_new_record = false
    self.allow_restart_game = false

    self.final_gold_score = ''
    self.final_depth_score = ''
    self.final_total_score = ''

    self.score_coroutine = cocreate(self.tally_score)
  end,
  update = function(self)
    if (costatus(self.score_coroutine) != 'dead') then
      coresume(self.score_coroutine, self)
    end

    if self.is_new_record then
      self.new_record_color_index += 1
      if (self.new_record_color_index % #colors_light_to_dark == 0) self.new_record_color_index = 1
    end

    if self.allow_restart_game then
      self.restart_game_text_blink += 1
      if (self.restart_game_text_blink > 60) self.restart_game_text_blink = 1

      if btnp(4) or btnp(5) then
        change_scene(game_scene)
      end
    end
  end,
  draw = function(self)
    cls()

    local starting_y = 30
    center_print("gold: ".. self.gold_counter .." x ".. self.gold_multiplier .." = ".. self.final_gold_score, starting_y, 7)
    center_print("meters: ".. self.depth_counter .." x ".. self.depth_multiplier .." = ".. self.final_depth_score, starting_y + 8, 7)

    if (self.show_scores) then
      center_print("score: ".. self.final_total_score, starting_y + 24, 10)
      center_print("high score: ".. high_score, starting_y + 32, 6)
    end

    if (self.is_new_record) then
      center_print("new record!", starting_y + 40, self.new_record_color_index)
    end
    
    if self.allow_restart_game and self.restart_game_text_blink > 30 then
      center_print("press z or x to try again", starting_y + 64, 7)
    end
  end
})
