--[[0

]]
local G = require 'gf'
local c_layout_v = require 'c_layout_v'
local c_perfectsize = require 'c_perfectsize'
local tp,tc,com,tk
tc = G.Entity()
G.cacheUI(tc)
tc.name = 'v_record'
tc.left = -640.000
tc.right = 640.000
tc.bottom = -360.000
tc.top = 360.000
tp = tc
	tc = G.Entity()
	tp.addChild(tc)
	tc.name = '功能区'
	tc.pivotX = 1.000
	tc.left = -270.000
	tc.right = -20.000
	tc.bottom = -350.000
	tc.top = 350.000
	tc.anchor = 0x32326464
	tp = tc
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = '背景版'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x64006400
		tc.color = 0xabfafa
		tc.img = 0x56000001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Quad()
		tp.addChild(tc)
		tc.name = 'mask'
		tc.left = -1.000
		tc.right = 1.000
		tc.bottom = -1.000
		tc.top = 1.000
		tc.anchor = 0x64006400
		tc.mouseEnabled = true
		tc.mask = 128
		tc.img = 0x56000001
		tp = tc
		tp = tp.parent
		--end
		tc = G.Entity()
		tp.addChild(tc)
		tc.name = '我方牌库面签'
		tc.right = 0.000
		tc.top = 0.000
		tc.anchor = 0x5a006400
		tp = tc
			tc = G.Quad()
			tp.addChild(tc)
			tc.name = '容器'
			tc.pivotX = 0.000
			tc.pivotY = 1.000
			tc.right = 250.000
			tc.top = 0.000
			tc.anchor = 0x64640000
			tp = tc
				tc = G.Entity()
				tp.addChild(tc)
				tc.name = '牌库顶分割线'
				tc.pivotX = 0.000
				tc.pivotY = 1.000
				tc.right = 250.000
				tc.bottom = -15.000
				tc.top = 0.000
				tc.anchor = 0x64640000
				tc.mouseEnabled = true
				tc.visible = false
				tp = tc
					tc = G.Quad()
					tp.addChild(tc)
					tc.name = 'Background'
					tc.right = 0.000
					tc.top = 0.000
					tc.anchor = 0x64006400
					tc.color = 0x0
					tc.img = 0x56000001
					tp = tc
					tp = tp.parent
					--end
					tc = G.TextQuad()
					tp.addChild(tc)
					tc.name = 'Name'
					tc.right = 0.000
					tc.top = 0.000
					tc.anchor = 0x64006400
					tc.font = 0x65140000
					tp = tc
					tp = tp.parent
					--end
				tp = tp.parent
				--end
				tc = G.Quad()
				tp.addChild(tc)
				tc.name = '牌库顶卡牌'
				tc.pivotX = 0.000
				tc.pivotY = 1.000
				tc.right = 250.000
				tc.top = 0.000
				tc.anchor = 0x64640000
				tc.visible = false
				tp = tc
				tp.c_layout_v = setmetatable({}, c_layout_v)
				com = tp.c_layout_v
				com['alignment_h'] =1.000
				com['alignment_v'] =0.000
				com['ColSpace'] =5.000
				com['startSpaceX'] =0.000
				com['startSpaceY'] =0.000
				com['changePivot'] =false
				com['changeAnchor'] =false
				tp.c_perfectsize = setmetatable({}, c_perfectsize)
				com = tp.c_perfectsize
				com['height'] =true
				com['expheight'] =0.000
				com['minheight'] =nil
				com['width'] =false
				com['expwidth'] =nil
				com['minwidth'] =nil
				tp = tp.parent
				--end
				tc = G.Entity()
				tp.addChild(tc)
				tc.name = '牌库分割线'
				tc.pivotX = 0.000
				tc.pivotY = 1.000
				tc.right = 250.000
				tc.bottom = -15.000
				tc.top = 0.000
				tc.anchor = 0x64640000
				tc.mouseEnabled = true
				tc.visible = false
				tp = tc
					tc = G.Quad()
					tp.addChild(tc)
					tc.name = 'Background'
					tc.right = 0.000
					tc.top = 0.000
					tc.anchor = 0x64006400
					tc.color = 0x0
					tc.img = 0x56000001
					tp = tc
					tp = tp.parent
					--end
					tc = G.TextQuad()
					tp.addChild(tc)
					tc.name = 'Name'
					tc.right = 0.000
					tc.top = 0.000
					tc.anchor = 0x64006400
					tc.font = 0x651e0000
					tp = tc
					tp = tp.parent
					--end
				tp = tp.parent
				--end
				tc = G.Quad()
				tp.addChild(tc)
				tc.name = '牌库卡牌'
				tc.pivotX = 0.000
				tc.pivotY = 1.000
				tc.right = 250.000
				tc.top = 0.000
				tc.anchor = 0x64640000
				tc.visible = false
				tp = tc
				tp.c_perfectsize = setmetatable({}, c_perfectsize)
				com = tp.c_perfectsize
				com['height'] =true
				com['expheight'] =0.000
				com['minheight'] =nil
				com['width'] =false
				com['expwidth'] =nil
				com['minwidth'] =nil
				tp.c_layout_v = setmetatable({}, c_layout_v)
				com = tp.c_layout_v
				com['alignment_h'] =1.000
				com['alignment_v'] =0.000
				com['ColSpace'] =5.000
				com['startSpaceX'] =0.000
				com['startSpaceY'] =0.000
				com['changePivot'] =false
				com['changeAnchor'] =false
				tp = tp.parent
				--end
				tc = G.Entity()
				tp.addChild(tc)
				tc.name = '牌库底分割线'
				tc.pivotX = 0.000
				tc.pivotY = 1.000
				tc.right = 250.000
				tc.bottom = -15.000
				tc.top = 0.000
				tc.anchor = 0x64640000
				tc.mouseEnabled = true
				tc.visible = false
				tp = tc
					tc = G.Quad()
					tp.addChild(tc)
					tc.name = 'Background'
					tc.right = 0.000
					tc.top = 0.000
					tc.anchor = 0x64006400
					tc.color = 0x0
					tc.img = 0x56000001
					tp = tc
					tp = tp.parent
					--end
					tc = G.TextQuad()
					tp.addChild(tc)
					tc.name = 'Name'
					tc.right = 0.000
					tc.top = 0.000
					tc.anchor = 0x64006400
					tc.font = 0x651e0000
					tp = tc
					tp = tp.parent
					--end
				tp = tp.parent
				--end
				tc = G.Quad()
				tp.addChild(tc)
				tc.name = '牌库底卡牌'
				tc.pivotX = 0.000
				tc.pivotY = 1.000
				tc.right = 250.000
				tc.top = 0.000
				tc.anchor = 0x64640000
				tc.visible = false
				tp = tc
				tp.c_perfectsize = setmetatable({}, c_perfectsize)
				com = tp.c_perfectsize
				com['height'] =true
				com['expheight'] =0.000
				com['minheight'] =nil
				com['width'] =false
				com['expwidth'] =nil
				com['minwidth'] =nil
				tp.c_layout_v = setmetatable({}, c_layout_v)
				com = tp.c_layout_v
				com['alignment_h'] =1.000
				com['alignment_v'] =0.000
				com['ColSpace'] =5.000
				com['startSpaceX'] =0.000
				com['startSpaceY'] =0.000
				com['changePivot'] =false
				com['changeAnchor'] =false
				tp = tp.parent
				--end
				tc = G.Entity()
				tp.addChild(tc)
				tc.name = '卡牌信息'
				tc.pivotX = 0.000
				tc.pivotY = 1.000
				tc.right = 250.000
				tc.bottom = -30.000
				tc.top = 0.000
				tc.anchor = 0x64640000
				tc.mouseEnabled = true
				tc.visible = false
				tp = tc
					tc = G.Quad()
					tp.addChild(tc)
					tc.name = 'Background'
					tc.right = 0.000
					tc.top = 0.000
					tc.anchor = 0x64006400
					tc.color = 0x717171
					tc.img = 0x56000001
					tp = tc
					tp = tp.parent
					--end
					tc = G.TextQuad()
					tp.addChild(tc)
					tc.name = 'Name'
					tc.right = 0.000
					tc.top = 0.000
					tc.anchor = 0x64006400
					tc.text = '卡牌名字'
					tc.font = 0x651e0000
					tc.style = 13
					tp = tc
					tp = tp.parent
					--end
				tp = tp.parent
				--end
			tp.c_perfectsize = setmetatable({}, c_perfectsize)
			com = tp.c_perfectsize
			com['height'] =true
			com['expheight'] =0.000
			com['minheight'] =nil
			com['width'] =false
			com['expwidth'] =nil
			com['minwidth'] =nil
			tp.c_layout_v = setmetatable({}, c_layout_v)
			com = tp.c_layout_v
			com['alignment_h'] =1.000
			com['alignment_v'] =0.000
			com['ColSpace'] =1.000
			com['startSpaceX'] =0.000
			com['startSpaceY'] =0.000
			com['changePivot'] =false
			com['changeAnchor'] =false
			tp = tp.parent
			--end
		tp = tp.parent
		--end
	tp = tp.parent
	--end
