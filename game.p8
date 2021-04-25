pico-8 cartridge // http://www.pico-8.com
version 32
__lua__

#include globals.lua
#include utils.lua
#include scene.lua
#include particles.lua
#include vector.lua
#include title_scene.lua
#include game_scene.lua
#include score_scene.lua



function _init()
  change_scene(title_scene)
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
00000000000000999000000000000000000000000000000000000000000000999000000000000009990000006600009990000000000000000000009990000000
007007000000099a990000000000009990000000000000999000000000000999a9000000000000999a90000066000999a9000000000000000000099a99000000
0007700000000999990000000000099a9900000000000999a9000000000009999990000000000099999900000040099999900000000000000000099999000000
0007700000000f1f1f0000000000099999000000000009999990000000000fffff000000000000ff1f10000000040ff1f10000000000000000000f1f1f000000
00700700000005fff500000000000f1f1f00000000000fffff00000000000ff1f1000000000000f5fff0000000004f5fff00000000000000000005fff5000000
000000000000055555000000000005fff500000000000ff1f10000000000055fff000000000000f5555000000000045555a00000000000000000055555000000
00000000000005555500000000000555550000000000055fff0000000000aa5555a0000000000ac5555a0000000aacf555aa0000000000000000055555444000
000000000000acaaaca000000000a55555a000000000aa5555a000000000aa5555aa00000000aaccaacaa00000aaacaaaca00000000000000000acaaaca40000
00000000000aacccccaa0000000aacaaacaa00000000aa5555aa00000000aaacccaaa0000000aaaccccaaa0000aaaaaacc00000000000000000aacccccaa0000
00000000000aaccccca40000000aacccccaa00000000aaacccaa00000000caaa444446600000caaaa4444466000aaaaccc00000000000000000aacccccaa0000
00000000000fcccccccf4000000aaccccca400000000caaa4faa00000000ccaaafc006600000ccaaaaf000660000cccccc00000000000000000fcccccccf0000
000000000000ccccccc00400000fcccccccf40000000ccaaf4a000000000ccccccc000000000ccccccc00000000ccccccc00000000000000000fcccccccf0000
000000000000cc000cc000660000ccccccc004000000cccccc4000000000cc000cc000000000cc000cc00000000cc000cc000000000000000000cc000c656000
000000000000cc000cc000660000cc000cc000660000cc000cc660000000cc000cc00000000ccc000cc00000000cc000cc000000000000000000cc000c666000
000000000000dd000dd000000000dd000dd000660000ddd00dd660000000ddd00ddd0000000ddd000ddd0000000dddd0ddd00000000000000000dd000dd60000
00000000000000000000000000000000000000000666000000000000000000000000000006660000000000000000000000000000000000000000000000000000
00000000000000999000000000000000000000000650009990000000000000000000000006500099900000000000000000000000000000000000000000000000
000000000000099a99000000000000999000000007040999a9000000000000099900000007040999a90000000000000099900000000000000000000000000000
0000000000000999990000000000099a9900000000f0499999900000000000999a90000000f04999999000000000000999a90000000000000000000000000000
0000000000000f1f1f000000000009999900000000aa0ff1f1000000000000999999000000aa0ff1f10000000000000999999000000000000000000000000000
00000000000005fff500000000000f1f1f00000000aaaf5fffa00000000000fffff0000000aaaf5fffa000000000000fffff0000000000000000000000000000
000000000000055555000000000005fff500000000aaaf5555a00000000000ff1f10000000aaaf5555a000000000000ff1f10000000000000000000000000000
000000000000a55555a07660000005555500000000aaaac555aa0000000000f5fff0000000aaaac555aa00000000000f5fff0766000000000000000000000000
00000000000aacaaacaa05600000a55555a07660000aaacaacaa000000000ac555500000000aaacaacaa0000000000aa55550056000000000000000000000000
00000000000aacccccaa4060000aacaaacaa05600000cccccccc00000000aaca555000000000cccccccc000000000aaac555a406000000000000000000000000
00000000000aaccccca40000000aacccccaa40600000cccccccc00000000aaacccaa00000000cccccccc000000000aaaccaf4000000000000000000000000000
00000000000fcccccccf0000000aaccccca400000000cccccccc00000000caaaccaa00000000cccccccc000000000caaaaa4f000000000000000000000000000
000000000000ccccccc00000000fcccccccf0000000cccccccc000000000ccaaf4f00000000cccccccc0000000000ccaaacc0000000000000000000000000000
000000000000cc000cc000000000ccccccc00000000cc0000cc000000000cccccc407000000cc0000cc0000000000ccccccc0000000000000000000000000000
000000000000cc000cc000000000cc000cc00000000cc0000cc000000000cc000cc56000000cc0000cc000000000ccc000cc0000000000000000000000000000
000000000000dd000dd000000000dd000dd00000000dddd00ddd00000000ddd00d666000000dddd00ddd0000000ddd0000ddd000000000000000000000000000
000000000000000000000000000000000000000000dd0000000dd000000000000000000000000000000000000000000000000000000000000000000000000000
099900000000009990000000000000999000000000cc0099900cc00000dd0000000dd00000000099900000000000000999000000000000000000000007888700
97aa90000000099a990000000000099a9900000000cc099a990cc00000cc0099900cc00000000999a9000000000000999a900000000000000000000077777770
97aa900000000999990000000000099999000000000cc99999cc000000cc099a990cc00000000999999000000000009999990000000000000000000078888870
97aa900000000f1f1f00000000000f1f1f000000000ccfffffcc0000000cc99999cc000000000ff1f1000000000000ff1f100000000000000000000007888700
09990000000005fff5000000000005fff50000000000cf1f1fc00000000ccfffffcc000000000f5fff060000000000f5fff0e000000000000000000000787000
00000000000005555500000000000555550000000000a5fff5a000000000cf1f1fc0000000000f555506e000000000f55550e600000000000000000000070000
000000000000a55555a000000000a55555a000000000a55555a000000000a5fff5a000000000acc555a6e600000000cc5550e6e0000000000000000000000000
04000000000aacaaacaa0000000aacaaacaa00000000a55555a000000000a55555a00000000aaccaaca6e6e000000accaacae6e6000000000000000000000000
40400000000aacccccaa0000000aacccccaa00000000accccca000000000a05550a00000000aaacccca6e6e600000aacccca66e6000000000000000000000000
04500000000aafcccfaa0000000aafcccfaa00000000f00000f000000000f00000f00000000caaaacca66e600000aaaaacc06e6e000000000000000000000000
0005000000066666eeee0000000eeee66666000000066666eeee0000000eee6666660000000ccaaaaf0e6e000000caaaaaaf6e60000000000000000000000000
000057000000eee66660000000006666eee000000000eee6666000000000666eeee00000000ccccccc0e6000000ccccccc006e00000000000000000000000000
000066600000c66eeec000000000cee666c000000000066eee00000000000ee666000000000cc000cc0e0000000cc000cc006000000000000000000000000000
000006600000cce66cc000000000cc6eecc00000000000e6600000000000006ee000000000ccc000cc00000000ccc000cc000000000000000000000000000000
000000000000dd060dd000000000dd060dd00000000000060000000000000006000000000ddd0000ddd000000ddd0000ddd00000000000000000000000000000
0000000000000000000000000000000000099a000000009a90000000000000999000000006660000000000000000000000000000000000000000000000000000
00076660000000000000000000000000009999990000099999000000000009999900000006500099900000000000000000000000000000000000000000000000
000005600000000000000000000000000099f1f000000fffff000000000009999900000006040999a90000000000000099900000000000000000000000000000
0000406000007777777000000000000000ff5ff000000f1f1f00000000000fffff00000000f04999999000000000000999a90000000000000000000000000000
0004006000078878788700000000000000ff5550000005fff500000000000fffff00000000aa0ff1f10000000000000999999000000000000000000000000000
0040000000788788878870000000ccccaaaa555000000555550000000000afffffa0000000aaaf5fffa000000000000fffff0000000000000000000000000000
04000000077777777777770000ccccccaaaaa000000aa55555aa0000000accccccca000000aaaf5555a000000000000ff1f10000000000000000000000000000
000000000788788888788700dcccccc888aaa000000aacccccaa000000fcccccccccf00000aaaac555aa00000000000f5fff0766000000000000000000000000
000000000078878887887000dcc77777777aff00077aa77777aa77000ffcccccccccff00000aaacaacaa0000000000aa55550056000000000000000000000000
007990000007887878870000dd88788888788f00078ff88888ff87000f8ddcc8ccdd8f000000cccccccc000000000aaac555a406000000000000000000000000
00909000000078878870000000788788878870000078878887887000007ddc888cdd70000000cccccccc000000000aaaccaf4000000000000000000000000000
76666650000007878700000000078878788700000007887878870000000dd87878dd00000000cccccccc000000000caaaaa4f000000000000000000000000000
07ee6e000000007870000000000078878870000000007887887000000000788788700000000cccccccc0000000000ccaaacc0000000000000000000000000000
0076e0000000000700000000000007878700000000000787870000000000078787000000000cc0000cc0000000000ccccccc0000000000000000000000000000
000600000000000000000000000000787000000000000078700000000000007870000000000cc0000cc000000000ccc000cc0000000000000000000000000000
000000000000000000000000000000070000000000000007000000000000000700000000000dddd00ddd0000000ddd0000ddd000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000077777777777000000777777777777700000077777777770000000000
00000000000000000000000000000000000000000000000000000000000000000000000077666666666600000766666666666600000766666666660000000000
00000000000000000000000000000000000000000000000000000000000000766000000077666666666660000766666666666600007666666666660000000000
00000000000007776666650000000000000000000000000000055000000000766000000077666666666666000766666666666600076666666666660000000000
00000000000076666666650000000000000000000000000000500500000006666600000077666666666666600000076666000000076666000000000000000000
0000000000000000005665000000799999900000000000080500a5a0000067777760000077666002266666600000076666000000076660000000000000000000
00000000000000000445650000009000009000000000008885000a00000677707776000077666000226666600000076666000000076660000000000000000000
00000000000000004420650000766666666660000000088888000000006777707777600077666000022666600000076666000000076660000000000000000000
00000000000000044200650000eeeee6666660000000888882200000006777707777600077666000022666600000076666000000076660005666600000000000
00000000000000442000650000076666eeee00000008888822000000006777700077600077666000022666600000076666000000076660005666660000000000
0000000000000442000065000000ee66666000000088888220000000006777777777600077666000226666600000076666000000076660005666666000000000
0000000000004420000065000000076eee0000000888882200000000000677777776000077666002266666600000076666000000076660000000266000000000
000000000004420000005000000000e6600000008888822000000000000067777760000077666666666666600000076666000000076666000000266000000000
00000000004420000000000000000006000000000888220000000000000006666600000077666666666666000777776666777700076666666666666000000000
00000000044200000000000000000000000000000082200000000000000000000000000077666666666660000766666666666600006666666666666000000000
00000000042000000000000000000000000000000002000000000000000000000000000077666666666600000766666666666600000666666666660000000000
00000000000000000000000000000000000000000000000000000000000000009990000007777777777777000777777777777700000000444200000000000000
000000000000000000000000000000000000000000000000999000000000000999a9000007666666666666000766666666666600000000400200000000000000
00000000000000000000000000000000000000000000000999a90000000000099999900007666666666666000766666666666600000000444200000000000000
00000000000000000000000000000000000000000000000999999000000000000000000007666666666666000766666666666600000000055000000000000000
00000000000000000000000000000000000000000000000fffff00000000000fffff000000000766660000000000076666000000000000055000000000000000
00000000000000000000000000000000000000000000000ff1f100000000000fffff000000000766660000000000076666000000000000055000000000000000
000000000355555555555500000000000000000000000aaf5fffa0000000000ff1f1000000000766660000000000076666000000000000055000000000000000
00000000001222222222200000000000000000000000aaac5555a00000000aaf5fffa00000000766660000000000076666000000000000055000000000000000
00000000003555555555500000344444444440000034aa44555540000000aaac5555a00000000766660000000000076666000000000000055000000000000000
00000000000122222222000000012222222200000001aaa2222200000034aa445555400000000766660000000000076666000000000000055000000000000000
000000000003555555550000000344444444000000034aaf444400000001aaa22222000000000766660000000000076666000000000007666660000000000000
0000000000001222222000000000122222200000000012222220000000034aaf4444000000000766660000000000076666000000000007666660000000000000
00000000000035555550000000003444444000000000344444400000000012222220000000000766660000000000076666000000000007666660000000000000
00000000000d0000000d0000000d0000000d0000000d0000000d0000000d3444444d000007777766667777000000076666000000000000766600000000000000
0000000000d1d00000d1d00000d1d00000d1d00000d1d00000d1d00000d1d00000d1d00007666666666666000000076666000000000000766600000000000000
00000000000d0000000d0000000d0000000d0000000d0000000d0000000d0000000d000007666666666666000000076666000000000000066000000000000000
44444444444444446666666666666666555555555555555565555555555555556555555555555555555555555555555555555555555555555555556555556555
44444444444444446666666666666666555555555555555556555555555555555655555655565555555555555555555555555555555555556555565555555656
44444444444444446666666666666666555555555555555555655555555555555565655565555655555555555aa95555565555555aa95565565555655aa95565
44444444444444446666666666666666555555555555555555565555555565555556555556556555555555555aa95555556555555aa96655556566555aa96655
44444444444444446666666666666666555555555555555555655555555655555556555555565665555555555555555555565555555655555556555555565555
44444444444444446666666666666666555555555555555555655555556555555565565555655555555559955555555555566995555655555556699555565555
4444444444444444666666666666666655555555555555555655555556565555565555565656555555555aa555555555556556a555656555556556a555656555
4444444444444444666666666666666655555555555555555555555565555555555555656555555555555aa55555555556555665555555655655566565555565
44444444444444446666666666666666555555555555555555555556555555555565555655655555555555555555555555555556555555555555555656555555
44444444444444446666666666666666555555555555555555555555556555555556565555655556555555555555555555555555556565555555556565656555
44444444444444446666666666666666555555555555555555556555555555555555655555565655555555555555555555556555555655555655656555565555
44444444444444446666666666666666555555555555555555565655555556555556565555556555555555555555aa955555565555556a955566565555556a95
44444444444444446666666666666666555555555555555556555555555565555655555555556555555555555555aa95555565655556a695555565655556a695
44444444444444446666666666666666555555555555555555555565556556555555556555655655559a55555555555555965555556555655596555555655565
4444444444444444666666666666666655555555555555555555555555555565555555555555556555aa555555555555556a555555555556556a555555565556
44444444444444446666666666666666555555555555555555555555555555555555555555555555555555555555555555555555555555555655555555556555
44444444444455446666666665666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000
45544444444445446666666556666666666666666666666666666666656565660000000000000000000000000000000000000000000000000000000000000000
45544444444445446566665666666666666666666666666666566666665666660000000000000000000000000000000000000000000000000000000000000000
445444454444455466566566666666566666aa66666aa9666665aa66656aa9660000000000000000000000000000000000000000000000000000000000000000
445544454444444466565666666656666666aa66666aa9666666a565566aa9660000000000000000000000000000000000000000000000000000000000000000
444555455554544466665666665666666666aa666666666666665a66666566660000000000000000000000000000000000000000000000000000000000000000
44444544445554446656665666656666666666666666666666556656656656660000000000000000000000000000000000000000000000000000000000000000
44445544444454446666666566656666666666666666666665665666566665660000000000000000000000000000000000000000000000000000000000000000
44554444444454446666665655566666666666666666666656666565656666650000000000000000000000000000000000000000000000000000000000000000
44544444444444546655656566555566666666666666666666666656565665660000000000000000000000000000000000000000000000000000000000000000
45544444444445546666566666666666666666666699666666666566565966660000000000000000000000000000000000000000000000000000000000000000
444444444444554466666666665665666666666666aa66666665666566a556660000000000000000000000000000000000000000000000000000000000000000
444444444455444466655666666665666aa6666666aa66666555666656aa56660000000000000000000000000000000000000000000000000000000000000000
444444445544444466665666666556666aa66666666666666aa65665666665660000000000000000000000000000000000000000000000000000000000000000
44444445544444446655666666666656699666666666666669965666666666560000000000000000000000000000000000000000000000000000000000000000
44444444444444446666666666666665666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000
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
000800002f0502a05026050230502a05026050220501f0502805025050220501e0500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 06474844
00 06084344
01 06070844
02 06090844

