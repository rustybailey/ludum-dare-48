main_scene = make_scene({
  music = 1,
  init = function(self)
  end,
  update = function(self)
  end,
  draw = function(self)
    cls()

    center_print("ludum dare 48!!", screen_width/2, 7)
  end
})