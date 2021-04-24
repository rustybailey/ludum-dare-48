jon_scene = make_scene({
  music = 1,
  init = function(self)
    self:add({
      draw = function()
        circfill(64, 64, 5, 140)
      end
    })
  end,
  update = function(self)
  end,
  draw = function(self)
    cls()
  end
})
