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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000aaa000000000000000000000000000000000000000000000aaa00000000000000aaa000000660000aaa0000000000000000000000000000000
0070070000000a9a9a000000000000aaa0000000000000aaa000000000000a9a9a000000000000a9a9a0000066000a9a9a000000000000000000000000000000
0007700000000aaaaa00000000000a9a9a00000000000a9a9a00000000000aaaaa000000000000aaaaa0000000500aaaaa000000000000000000000000000000
00077000000007c7c700000000000aaaaa00000000000aaaaa000000000007777700000000000077c7c000000005077c7c000000000000000000000000000000
007007000000077777000000000007c7c700000000000777770000000000077c7c00000000000077777000000000577777000000000000000000000000000000
00000000000007777700000000000777770000000000077c7c000000000007777700000000000077777000000000057777c00000000000000000000000000000
000000000000cbcccbc00000000007777700000000000777770000000000ccbccbc0000000000cbbccbc0000000ccb7ccbcc0000000000000000000000000000
00000000000ccbcccbcc00000000cbcccbc000000000ccbccbc000000000ccbccbcc00000000ccbbccbcc00000cccbcccbc00000000000000000000000000000
00000000000ccbbbbbcc0000000ccbcccbcc00000000ccbccbcc00000000cccbbbccc0000000cccbbbbccc0000ccccccbb000000000000000000000000000000
00000000000ccbbbbbc50000000ccbbbbbcc00000000cccbbbcc00000000bccc555556600000bcccc5555566000ccccbbb000000000000000000000000000000
000000000007bbbbbbb75000000ccbbbbbc500000000bccc57cc00000000bbccc7b006600000bbcccc7000660000bbbbbb000000000000000000000000000000
000000000000bbbbbbb005000007bbbbbbb750000000bbcc75c000000000bbbbbbb000000000bbbbbbb00000000bbbbbbb000000000000000000000000000000
000000000000bb000bb000660000bbbbbbb005000000bbbbbb5000000000bb000bb000000000bb000bb00000000bb000bb000000000000000000000000000000
000000000000bb000bb000660000bb000bb000660000bb000bb660000000bb000bb00000000bbb000bb00000000bb000bb000000000000000000000000000000
000000000000bb000bb000000000bb000bb000660000bbb00bb660000000bbb00bbb000000bbb0000bbb0000000bbbb0bbb00000000000000000000000000000
00000000000000000000000000000000000000000666000000000000000000000000000006660000000000000000000000000000000000000000000000000000
00000000000000aaa00000000000000000000000065000aaa00000000000000000000000065000aaa00000000000000000000000000000000000000000000000
0000000000000a9a9a000000000000aaa000000006050a9a9a0000000000000aaa00000006050a9a9a00000000000000aaa00000000000000000000000000000
0000000000000aaaaa00000000000a9a9a00000000705aaaaa000000000000a9a9a0000000705aaaaa0000000000000a9a9a0000000000000000000000000000
00000000000007c7c700000000000aaaaa00000000cc077c7c000000000000aaaaa0000000cc077c7c0000000000000aaaaa0000000000000000000000000000
000000000000077777000000000007c7c700000000ccc77777c00000000000777770000000ccc77777c000000000000777770000000000000000000000000000
000000000000077777000000000007777700000000ccc77777c0000000000077c7c0000000ccc77777c00000000000077c7c0000000000000000000000000000
000000000000cbcccbc06660000007777700000000ccccbccbcc0000000000777770000000ccccbccbcc00000000000777770666000000000000000000000000
00000000000ccbcccbcc05600000cbcccbc06660000cccbccbcc000000000cbccbc00000000cccbccbcc0000000000ccbccb0056000000000000000000000000
00000000000ccbbbbbcc5060000ccbcccbcc05600000bbbbbbbb00000000ccbccbc000000000bbbbbbbb000000000cccbbbbc506000000000000000000000000
00000000000ccbbbbbc50000000ccbbbbbcc50600000bbbbbbbb00000000cccbbbcc00000000bbbbbbbb000000000cccbbc75000000000000000000000000000
000000000007bbbbbbb70000000ccbbbbbc500000000bbbbbbbb00000000bcccbbcc00000000bbbbbbbb000000000bccccc57000000000000000000000000000
000000000000bbbbbbb000000007bbbbbbb70000000bbbbbbbb000000000bbcc75700000000bbbbbbbb0000000000bbcccbb0000000000000000000000000000
000000000000bb000bb000000000bbbbbbb00000000bb0000bb000000000bbbbbb506000000bb0000bb0000000000bbbbbbb0000000000000000000000000000
000000000000bb000bb000000000bb000bb00000000bb0000bb000000000bb000bb56000000bb0000bb000000000bbb000bb0000000000000000000000000000
000000000000bb000bb000000000bb000bb0000000000000000000000000bbb00b666000000bbbb00bbb0000000bbb0000bbb000000000000000000000000000
00000000000000000000000000000000000000000000000000000000bb00000000000bb000000000000000000000000000000000000000000000000000000000
00000000000000aaa0000000000000aaa0000000bbb000aaa000bbb0bbb000aaa000bbb0000000aaa00000000000000aaa000000000000000000000000000000
0000000000000a9a9a00000000000a9a9a000000bbbb0a9a9a0bbbb00bbb0a9a9a0bbb0000000a9a9a000000000000a9a9a00000000000000000000000000000
0000000000000aaaaa00000000000aaaaa0000000bbbbaaaaabbbb0000bbbaaaaabbb00000000aaaaa000000000000aaaaa00000000000000000000000000000
00000000000007c7c7000000000007c7c700000000bbb77777bbb000000bb77777bb00000000077c7c00000000000077c7c00000000000000000000000000000
0000000000000777770000000000077777000000000bb7c7c7bb00000000b7c7c7b000000000077777060000000000777770e000000000000000000000000000
0000000000000777770000000000077777000000000cc77777cc00000000c77777c00000000007777706e000000000777770e600000000000000000000000000
000000000000cbcccbc000000000cbcccbc00000000ccbcccbcc0000000ccbcccbcc00000000cbbccbc6e600000000bbccb0e6e0000000000000000000000000
00000000000ccbcccbcc0000000ccbcccbcc0000000ccbbbbbcc0000000ccbbbbbcc0000000ccbbccbc6e6e000000cbbccbce6e6000000000000000000000000
00000000000ccbbbbbcc0000000ccbbbbbcc00000000ccbbbcc000000000ccbbbcc00000000cccbbbbc6e6e600000ccbbbbc66e6000000000000000000000000
00000000000cc7bbb7cc0000000cc7bbb7cc0000000007000700000000000c000c000000000bccccbbc66e600000cccccbb06e6e000000000000000000000000
0000000000066666eeee0000000eeee66666000000066666eeee00000000070007000000000bbcccc70e6e000000bcccccc76e60000000000000000000000000
000000000000eee66660000000006666eee000000000eee666600000000eee6666660000000bbbbbbb0e6000000bbbbbbb006e00000000000000000000000000
000000000000b66eeeb000000000bee666b000000000066eee0000000000666eeee00000000bb000bb0e0000000bb000bb006000000000000000000000000000
000000000000bbe66bb000000000bb6eebb00000000000e66000000000000ee66600000000bbb000bb00000000bbb000bb000000000000000000000000000000
000000000000bb060bb000000000bb060bb0000000000006000000000000006ee00000000bbb0000bbb000000bbb0000bbb00000000000000000000000000000
00000000000000000000000000000000000aaa00000000aaa0000000000000aaa000000006660000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000aaaaa000000aaaaa00000000000aaaaa000000065000aaa00000000000000000000000000000000000000000000000
0000000000000000000000000000000000777c700000077777000000000007777700000006050a9a9a00000000000000aaa00000000000000000000000000000
00000000000000000000000000000bbbbb777770000007c7c7000000000007777700000000705aaaaa0000000000000a9a9a0000000000000000000000000000
000000000000000000000000000bbbbbbb7777700000077777000000000007777700000000cc077c7c0000000000000aaaaa0000000000000000000000000000
00000000000077777770000000bbbbbbcccccc00000cc77777cc00000000c77777c0000000ccc77777c000000000000777770000000000000000000000000000
0000000000078878788700000bbbbbbbccccc00000cccbcccbccc000000cbbbbbbbc000000ccc77777c00000000000077c7c0000000000000000000000000000
000000000078878887887000bbbbbbb88cccc00000cccbbbbbccc000007bbbbbbbbb700000ccccbccbcc00000000000777770666000000000000000000000000
000000000777777777777700bbb7777777cc770007ccc77777ccc700077bbbbbbbbb7700000cccbccbcc0000000000ccbccb0056000000000000000000000000
000000000788788888788700b7887888887c8700078cc88888cc8700078bbbb8bbbb87000000bbbbbbbb000000000cccbbbbc506000000000000000000000000
00000000007887888788700000788788878870000078878887887000007bbb888bbb70000000bbbbbbbb000000000cccbbc75000000000000000000000000000
00000000000788787887000000078878788700000007887878870000000bb87878bb00000000bbbbbbbb000000000bccccc57000000000000000000000000000
000000000000788788700000000078878870000000007887887000000000788788700000000bbbbbbbb0000000000bbcccbb0000000000000000000000000000
000000000000078787000000000007878700000000000787870000000000078787000000000bb0000bb0000000000bbbbbbb0000000000000000000000000000
000000000000007870000000000000787000000000000078700000000000007870000000000bb0000bb000000000bbb000bb0000000000000000000000000000
000000000000000700000000000000070000000000000007000000000000000700000000000bbbb00bbb0000000bbb0000bbb000000000000000000000000000
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
44444444444444446666666666666666555555555555555575555555555555557555555555555555000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555557555555555555555755555755575555000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555555755555555555555575755575555755000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555555575555555575555557555557557555000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555555755555555755555557555555575775000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555555755555557555555575575555755555000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555557555555575755555755555757575555000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555555555555755555555555557575555555000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555555555557555555555575555755755555000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555555555555557555555557575555755557000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555555557555555555555555755555575755000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555555575755555557555557575555557555000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555557555555555575555755555555557555000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555555555575557557555555557555755755000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555555555555555555755555555555555575000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555555555555555555555555555555555555000000000000000000000000000000000000000000000000
00000000000000006666666667666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006666666776666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006766667666666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006676676666666676000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006676766666667666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006666766666766666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006676667666676666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006666666766676666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006666667677766666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006677676766777766000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006666766666666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006666666666766766000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006667766666666766000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006666766666677666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006677666666666676000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006666666666666667000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
