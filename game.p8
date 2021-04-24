pico-8 cartridge // http://www.pico-8.com
version 32
__lua__

#include globals.lua
#include utils.lua
#include scene.lua
#include game_scene.lua


function _init()
  change_scene(game_scene)
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
00000000cccccccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000ccccccffffcccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700cccccffffffccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000cccccff0f0fccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000cccccffffffccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700cccccffffffccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000ccccccffffcccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cc555cc88ccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cc505cc88ccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cc555cc88ccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000ccc40888888ccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000ccc4008888cccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000ccc4008888cccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cc54508888cccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cc5550088ccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000ccc500088ccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffff6666666666666666555555555555555500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6446666464466446566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6446644666444666566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6444444444644646566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6446664444664646566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6466464444464646566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6464444444444446566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6464444444444446566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6444446446644446566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6444466444466446566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6644464444444446566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6444464444446466566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6464466464466646566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6664444666446446566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
f44444444444444f6644444666444466566666666666666500000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffff6666666666666666555555555555555500000000000000000000000000000000000000000000000000000000000000000000000000000000
