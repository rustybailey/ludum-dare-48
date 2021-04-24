pico-8 cartridge // http://www.pico-8.com
version 32
__lua__

#include globals.lua
#include utils.lua
#include scene.lua
#include particles.lua
#include vector.lua
#include game_scene.lua


function _init()
  change_scene(game_scene)
  current_scene:init()
end

function _update60()
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
0070070000000aa9aa000000000000aaa0000000000000aaa000000000000a9a9a000000000000a9a9a0000066000a9a9a000000000000000000000000000000
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
00000000000000000000000000000000000000000000000000000000000000000000000000000050050000000007990000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000076600000000000050a005000000009090000000000000000000000000000000000
00000000000007777776600000000000000000000000000000055000000000766000000000088000000500000766666600000000000000000000000000000000
00000000000076666666660000000000000000000000000000500500000006666600000000888000000050000076666000000000000000000000000000000000
0000000000000000000666000000799999900000000000080500a5a0000067777760000008880000000006600007660000000000000000000000000000000000
00000000000000000550660000009000009000000000008885000a00000677707776000088800000000006600000600000000000000000000000000000000000
00000000000000005520660000766666666660000000088888000000006777707777600088000000000000000000000000000000000000000000000000000000
00000000000000055200660000eeeee6666660000000888882200000006777707777600000000000000000000000000000000000000000000000000000000000
00000000000000552000660000076666eeee00000008888822000000006777700077600000066660000999000000000000000000000000000000000000000000
0000000000000552000066000000ee666660000000888882200000000067777777776000000005600097aa900000000000000000000000000000000000000000
0000000000005520000066000000076eee00000008888822000000000006777777760000000050600097aa900000000000000000000000000000000000000000
000000000005520000006000000000e66000000088888220000000000000677777600000000500600097aa900000000000000000000000000000000000000000
000000000055200000000000000000060000000008882200000000000000066666000000005000000097aa900000000000000000000000000000000000000000
00000000055200000000000000000000000000000082200000000000000000000000000005000000000999000000000000000000000000000000000000000000
00000000052000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000aaa0000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000aaa000000000000a9a9a000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000a9a9a00000000000aaaaa000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000aaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000777770000000000077777000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000077c7c0000000000077777000000000000000000000000000000000000000000000000000000000000
000000000355555555555500000000000000000000000cc77777c000000000077c7c000000000000000000000000000000000000000000000000000000000000
00000000001222222222200000000000000000000000cccbcccbc00000000cc77777c00000000000000000000000000000000000000000000000000000000000
00000000003555555555500000355555555550000035cc55555550000000cccbcccbc00000000000000000000000000000000000000000000000000000000000
00000000000122222222000000012222222200000001ccc2222200000035cc555555500000000000000000000000000000000000000000000000000000000000
000000000003555555550000000355555555000000035cc7555500000001ccc22222000000000000000000000000000000000000000000000000000000000000
0000000000001222222000000000122222200000000012222220000000035cc75555000000000000000000000000000000000000000000000000000000000000
00000000000035555550000000003555555000000000355555500000000012222220000000000000000000000000000000000000000000000000000000000000
00000000000d0000000d0000000d0000000d0000000d0000000d0000000d3555555d000000000000000000000000000000000000000000000000000000000000
0000000000d1d00000d1d00000d1d00000d1d00000d1d00000d1d00000d1d00000d1d00000000000000000000000000000000000000000000000000000000000
00000000000d0000000d0000000d0000000d0000000d0000000d0000000d0000000d000000000000000000000000000000000000000000000000000000000000
44444444444444446666666666666666555555555555555575555555555555557555555555555555555555555555555555555555555555555555557555557555
44444444444444446666666666666666555555555555555557555555555555555755555755575555555555555555555555555555555555557555575555555757
44444444444444446666666666666666555555555555555555755555555555555575755575555755555555555aab5555575555555aab5575575555755aab5575
44444444444444446666666666666666555555555555555555575555555575555557555557557555555555555aab5555557555555aab7755557577555aab7755
44444444444444446666666666666666555555555555555555755555555755555557555555575775555555555555555555575555555755555557555555575555
4444444444444444666666666666666655555555555555555575555555755555557557555575555555555bb55555555555577bb55557555555577bb555575555
4444444444444444666666666666666655555555555555555755555557575555575555575757555555555aa555555555557557a555757555557557a555757555
4444444444444444666666666666666655555555555555555555555575555555555555757555555555555aa55555555557555775555555755755577575555575
44444444444444446666666666666666555555555555555555555557555555555575555755755555555555555555555555555557555555555555555757555555
44444444444444446666666666666666555555555555555555555555557555555557575555755557555555555555555555555555557575555555557575757555
44444444444444446666666666666666555555555555555555557555555555555555755555575755555555555555555555557555555755555755757555575555
44444444444444446666666666666666555555555555555555575755555557555557575555557555555555555555aab55555575555557ab55577575555557ab5
44444444444444446666666666666666555555555555555557555555555575555755555555557555555555555555aab5555575755557a7b5555575755557a7b5
4444444444444444666666666666666655555555555555555555557555755755555555755575575555ba55555555555555b755555575557555b7555555755575
4444444444444444666666666666666655555555555555555555555555555575555555555555557555aa555555555555557a555555555557557a555555575557
44444444444444446666666666666666555555555555555555555555555555555555555555555555555555555555555555555555555555555755555555557555
00000000000000006666666667666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000
00000000000000006666666776666666666666666666666666666666676767660000000000000000000000000000000000000000000000000000000000000000
00000000000000006766667666666666666666666666666666766666667666660000000000000000000000000000000000000000000000000000000000000000
000000000000000066766766666666766666aa66666aa9666667aa66676aa9660000000000000000000000000000000000000000000000000000000000000000
000000000000000066767666666676666666aa66666aa9666666a767766aa9660000000000000000000000000000000000000000000000000000000000000000
000000000000000066667666667666666666aa666666666666667a66666766660000000000000000000000000000000000000000000000000000000000000000
00000000000000006676667666676666666666666666666666776676676676660000000000000000000000000000000000000000000000000000000000000000
00000000000000006666666766676666666666666666666667667666766667660000000000000000000000000000000000000000000000000000000000000000
00000000000000006666667677766666666666666666666676666767676666670000000000000000000000000000000000000000000000000000000000000000
00000000000000006677676766777766666666666666666666666676767667660000000000000000000000000000000000000000000000000000000000000000
00000000000000006666766666666666666666666699666666666766767966660000000000000000000000000000000000000000000000000000000000000000
000000000000000066666666667667666666666666aa66666667666766a776660000000000000000000000000000000000000000000000000000000000000000
000000000000000066677666666667666aa6666666aa66666777666676aa76660000000000000000000000000000000000000000000000000000000000000000
000000000000000066667666666776666aa66666666666666aa67667666667660000000000000000000000000000000000000000000000000000000000000000
00000000000000006677666666666676699666666666666669967666666666760000000000000000000000000000000000000000000000000000000000000000
00000000000000006666666666666667666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000
__sfx__
4b02000015650156501c6502065025650286502160000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600
4b0200000865008650086500e65012650196500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4a02000003650036500365007650096500d6500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00050000090501005018050290502d050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0108000007650006002e6502b650256500f65017650126400d6300d62005610006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600
00060000070500a0500c0500f0500c0500f05013050180501f050160501b0501f0502705227052270522705227050270500000000000000000000000000000000000000000000000000000000000000000000000
0110001004053040000f6550400004053040530f6550400004053040530f6550405304000040530f6550400000000000000000000000000000000000000000000000000000000000000000000000000000000000
0110000018050020002d050260501f050190501d05020050020002305502000230552805228052280522805230055300001d0501d000020002105018050110501305019050200502500027056250562705625056
0110000008751087510470004750047500a7500a750057000b7500b75009750097500675006750000002705108741087310470004750047500a7500a75005700067550675509755097550b7550b7550000027000
011000002705525055090002705527055250002505520000020002305502000230552805228052280522805230055300001d0001d000210552100018055180001305019050200502500027057250572705725057
__music__
00 06474844
00 06084344
01 06070844
02 06090844

