pico-8 cartridge // http://www.pico-8.com
version 32
__lua__

screen_width = 128
function center_print(message, y, color)
  local width = #message * 4
  local x = (screen_width - width) / 2
  print(message, x, y, color)
end

function merge_tables(a, b)
  for k,v in pairs(b) do
    a[k] = v
  end
  return a
end

function make_scene(options)
  local o = {
    init = options.init,
    update = options.update,
    draw = options.draw
  }

  local scene = {
    init = function(self)
      self.objects = {}
      if (self.music) then
        music(self.music)
      else
        music(-1)
      end
      o.init(self)
    end,
    add = function(self, object)
      if (object.init) then
        object:init()
      end
      return add(self.objects, object)
    end,
    remove = function(self, object)
      del(self.objects, object)
    end,
    update = function(self)
      if (o.update) then
        o.update(self)
      end
      for k, object in pairs(self.objects) do
        if (object.update) then
          object:update()
        end
      end
    end,
    draw = function(self)
      if (o.draw) then
        o.draw(self)
      end
      for k, object in pairs(self.objects) do
        if (object.draw) then
          object:draw()
        end
      end
    end
  }
  return merge_tables(options, scene)
end

function change_scene(scene)
  current_scene = scene
  current_scene:init()
end

main_game = make_scene({
  music = 1,
  init = function(self)
  end,
  update = function(self)
  end,
  draw = function(self)
    cls()

    center_print("ludum dare 48", screen_width/2, 7)
  end
})

current_scene = main_game

function _init()
  current_scene:init()
end

function _update()
  current_scene:update()
end

profiler_on = false
function _draw()
  current_scene:draw()

  if (profiler_on) then
    print('mem: '.. flr(stat(0)), 0, 0, 7)
    print('cpu: '.. (flr(stat(1) * 100)) .. '%', 0, 8, 7)
  end
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
