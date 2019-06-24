--[[3102
,
]]
local G = require 'gf'

local t = G.com()

t.prop = 
{
	{name = 'Horizontal', type = 'boolean', ctrl = 'boolean'},
	{name = 'Vertical', type = 'boolean', ctrl = 'boolean'},
	{name = 'Sensitivity', type = 'int', ctrl = 'dragint',ctrl_arg = { min=0,max = 100}},
	{name = 'type',	type = 'int', ctrl = 'combo_idx', ctrl_arg = { '普通版',  '优化版'} },
	{name = 'autoMove', type = 'boolean', ctrl = 'boolean'},
	{name = 'hideSlider', type = 'boolean', ctrl = 'boolean'},
	{name = 'elastic', type = 'boolean', ctrl = 'boolean'},
	{name = 'SpeedThreshold', type = 'number',},
	{name = 'SpeedMaxTime', type = 'number',},
	{name = 'SpeedecaytTime', type = 'number',},
	{name = 'diffItemHigh', type = 'boolean',},
}

function t:init()
	self.obj.mouseEnabled = true
	self.state = 'normal'
	self.mask = self.obj.getChildByName("mask")
	self.content = self.obj.getChildByName("content")
	self.slider = self.obj.getChildByName('slider')
	self.slider_bg = self.slider.getChildByName('背景')
	self.slider_bt = self.slider.getChildByName('按钮')
	
	self.needAutoMove = true
	self.visibleChildCount = 0 
	self.active_distancex = 0
	self.active_distancey = 0
	-- self.last_mousedownY = 0
end
function t:set_type()
	if self.type == 1 then
		self._dataNum = 20
		-- self.fun = function(ui_node,index)
		-- 	ui_node.c_button.text = index
		-- end 
		self.disvisiblefun = function(ui_node,index)
			ui_node.visible = false
		end
	end 
	self:getAllChildren()
end
function t:updateSlider()
	local contentHeight = self.content.real_height()
	if contentHeight == 0 then contentHeight = 1 end 
	local maskHeight = self.obj.real_height()
	if self.hideSlider then 
		self.slider.visible = false
		return 
	end 
	if self.type ~= 1 then
		if contentHeight <= maskHeight and self.content.y == 0 then 
			self.slider.visible = false
		else 
			self.slider.visible = true
			self.slider_bt.y = -self.content.y / (contentHeight) * maskHeight
			self.slider_bt.height = math.min(maskHeight,contentHeight-self.content.y)/contentHeight * maskHeight
		end 
	elseif self.layer then
		self:getVisibleChild()
		if self.visibleChildCount >= self._dataNum and self.content.y == 0 then  -- 判断是否超过一屏幕
			self.slider.visible = false
		else
			self.slider.visible = true
			local minindex = math.huge
			local minindexchild 
			for i=1,#self.allChild do
				if self.allChild[2] then 
					if minindex > self.allChild[i]._index then 
						minindex = self.allChild[i]._index
						minindexchild = self.allChild[i]
					end 
				end
			end 
			self.minindex = minindex
			if self.space then 
				if self.diffItemHigh then 
					local sumheigth = self._allHeight + (self._dataNum - 1) * self.space 
					if self.content.c_perfectsize then		-- 补充 perfectsize 设置的额外高度
						sumheigth = sumheigth + self.content.c_perfectsize.expheight 
					end
					local beforeheight = self.content.y 
					for i=1,(self.minindex-1) do
						beforeheight = beforeheight + self._dataHeight[i]
					end 
					if (self.minindex-1) > 1 then 
						beforeheight = beforeheight + (self.minindex-1) * self.space
					end 
					self.slider_bt.y = -(beforeheight) / sumheigth * maskHeight
					self.slider_bt.height = maskHeight / sumheigth * maskHeight
				else
					local sumheigth = math.ceil(self._dataNum/self.layer) * self:getObjectHeight(self.allChild[1]) + (math.ceil(self._dataNum/self.layer) - 1) * self.space 
					if self.content.c_perfectsize then		-- 补充 perfectsize 设置的额外高度
						sumheigth = sumheigth + self.content.c_perfectsize.expheight 
					end
					local beforeheight = (self.minindex-1)/self.layer * self:getObjectHeight(self.allChild[1]) + self.content.y 
					if ((self.minindex-1)/self.layer) > 1 then 
						beforeheight = beforeheight + (self.minindex-1)/self.layer * self.space
					end 
					self.slider_bt.y = -(beforeheight) / sumheigth * maskHeight
					self.slider_bt.height = maskHeight / sumheigth * maskHeight
				end 
			end 
		end 
	end 
	if self.Vertical ~= true then 
		self.slider.visible = false
	end 
end 
function t:setDataFun(fun)
	self.fun = fun
end 
function t:setDisvisibleFun(fun)
	self.disvisiblefun = fun
end 
function t:setDataNum(num)
	self._dataNum = num
end  
function t:setDataHeight(heights)
	self._dataHeight = heights
	self._allHeight = 0
	for i = 1,#self._dataHeight do
		self._allHeight = self._allHeight + self._dataHeight[i]
	end
end  
function t:initUI()
	if self.fun == nil then return end 
	self.active_time = 0 
	self:getAllChildren()
	for i=#self.allChild,self._dataNum+1,-1 do
		self.disvisiblefun(self.allChild[i][1],i)
		self.allChild[i][2] = false
		--table.remove( self.allChild,i)
	end 
	for index=1,self._dataNum do 
		if index <= #self.allChild then 
			self.fun(self.allChild[index][1],index)
			self.allChild[index][1].visible = true	
			self.allChild[index][2] = true		
		end 
	end 
	self.content.y= 0
	self:preProcessSuper('y')
	self:updateSlider()
end 
function t:initUITo(int_to)
	--将第一个节点设为第几个 定向
	if self.fun == nil then return end 
	if self.diffItemHigh then 
		local h = self.mask.real_height()
		for i=#self._dataHeight,1,-1 do
			h = h - self._dataHeight[i]-11
			if h < 0 then 
				if int_to > i then 
					int_to = i
				end
				break
			end 
			if i==1 and h>=0 then 
				int_to = i
			end
		end
	end 
	self.active_time = 0 
	self:getAllChildren()
	for i=1,#self.allChild do
		self.disvisiblefun(self.allChild[i][1],i)
		self.allChild[i][2] = false
		self.allChild[i]._index = i
	end 
	local childindex = 1
	for index=int_to,self._dataNum do 
		if childindex <= #self.allChild then 
			self.fun(self.allChild[childindex][1],index)
			self.allChild[childindex][1].visible = true	
			self.allChild[childindex][2] = true		
			self.allChild[childindex]._index = index
			childindex = childindex + 1
		else
			break
		end 
	end 
	for i=childindex,#self.allChild do
		self.disvisiblefun(self.allChild[i][1],i)
		self.allChild[i][2] = false
		self.allChild[i]._index = self._dataNum + 1
	end
	self.content.y= 0
	self:preProcessSuper('y')
	self:updateSlider()
end 
function t:initUIend()
	self:getAllChildren()
	for i=#self.allChild,self._dataNum+1,-1 do
		self.disvisiblefun(self.allChild[i][1],i)
		self.allChild[i][2] = false
	end 
	if self._dataNum > #self.allChild then 
		local int_d 
		for index=1,#self.allChild do 
			if self.allChild[index] then
				int_d = self._dataNum + index - #self.allChild
				self.fun(self.allChild[index][1],int_d)
				self.allChild[index][1].visible = true	
				self.allChild[index][2] = true		
				self.allChild[index]._index = int_d	
			else
				--error
				int_d = self._dataNum + index - #self.allChild 
			end
		end 
	else
		for index=1,self._dataNum do 
			self.fun(self.allChild[index][1],index)
			self.allChild[index][1].visible = true	
			self.allChild[index][2] = true		
		end 
	end
	self:preProcessSuper('y')
	self:updateSlider()
end 
function t:updateUI()
	self.active_time = 0 
	for index=1,#self.allChild do 
		if self.allChild[index]._index <= self._dataNum then 
			self.fun(self.allChild[index][1],self.allChild[index]._index)
			self.allChild[index][1].visible = true
			self.allChild[index][2] = true	
		else
			self.disvisiblefun(self.allChild[index][1],self.allChild[index]._index)
			self.allChild[index][2] = false
		end 
	end 
end 

function t:getObjectHeight(child)
	if self.diffItemHigh and self._dataHeight and #self._dataHeight >= child._index then 
		return self._dataHeight[child._index] 
	else
		return child[1].real_height()
	end 
end
function t:getVisibleChild()
	self.visibleChildCount = 0
	for index,child in ipairs(self.allChild) do
		if child[1].y <= 0 and child[1].visible and child[1].y > - self.obj.real_height() and child[1].y - self:getObjectHeight(child) > -self.obj.real_height() then 
			self.visibleChildCount = self.visibleChildCount + 1
		end 
	end 
end 
function t:preProcessSuper(xy)
	local sortfunc = function(a,b)
		if xy == 'y' then 
			-- if a[1].visible and not b[1].visible then return true 
			-- elseif b[1].visible and not a[1].visible then return false 
			-- else
			if a[1].y > b[1].y then return true
			elseif a[1].y == b[1].y then return a._index < b._index 
			else return false end 
		elseif xy == 'x' then
			-- if a[1].visible and not b[1].visible then return true 
			-- elseif b[1].visible and not a[1].visible then return false 
			-- else
			if a[1].x < b[1].x then return true
			elseif a[1].x == b[1].x then return a._index < b._index 
			else return false end 
		end 
	end 
	table.sort(self.allChild,sortfunc)
	local layer_child = {}
	local layer_index = 1
	local lastIndex = 1
	local firstIndex = self.allChild[1]._index
	local firstChild = self.allChild[1]
	self.visibleChildCount = 0
	for index,child in ipairs(self.allChild) do
		--if child[2] or child[1][xy] == firstChild[1][xy] then 
			if child[1][xy] == firstChild[1][xy] then 
				if layer_child[layer_index] == nil then 
					layer_child[layer_index] = {}
				end
				table.insert(layer_child[layer_index],child)
			else 
				layer_index = layer_index + 1
				firstChild = child
				if layer_child[layer_index] == nil then 
					layer_child[layer_index] = {}
				end 
				table.insert(layer_child[layer_index],child)
			end 
			if child[1].y <= 0 and child[1].y + self:getObjectHeight(child) < self.obj.real_height() then 
				self.visibleChildCount = self.visibleChildCount + 1
			end 
			lastIndex = child._index
		--end 
	end 
	-- 计算行间距
	local space = 0
	if #layer_child >= 2 then 
		if xy == 'y' then 
			space = layer_child[1][1][1].y - layer_child[2][1][1].y - self:getObjectHeight(layer_child[1][1])
		elseif xy == 'x' then 
			space = layer_child[2][1][1].x - layer_child[1][1][1].x - layer_child[1][1][1].real_width()
		end 
	end 
	self.layer_child = layer_child
	self.firstIndex = firstIndex
	self.lastIndex = lastIndex
	self.space = space
	self.layer = 1
	self.contentmax_y = self.contentmax_y or 0 
	if self.content.y > self.contentmax_y then 
		self.contentmax_y = self.content.y
	end
	if #layer_child >= 1 then 
		self.layer = #layer_child[1]
	end 
	-- self.layer 就是每行有多少列，优化版下面会多配一行
	-- self.visibleChildCount = #self.allChild - self.layer -- 可见区域内child的个数
	return layer_child,firstIndex,lastIndex,space
end 
function t:super_start2tail(layer_child,lastIndex)
	-- 开始移到最后
	for i=1,#layer_child[1] do 
		local fc = layer_child[1][i]
		fc._index = lastIndex + i
        self.content.addChild(fc[1])
        if (self.fun) then
            self.fun(fc[1],fc._index)
        end
		if fc._index > self._dataNum then 
			--fc[1].visible = false
			fc[2] = false
			self.disvisiblefun(fc[1],fc._index)
		end 
	end 
end 
function t:super_tail2start(layer_child,firstIndex)
	-- 最后移到开始
	for i=1,#layer_child[1] do 
		local fc = layer_child[#layer_child][i]
		fc._index = firstIndex - (#layer_child[1]-i+1)
        self.content.addChildAt(layer_child[#layer_child][i][1],i-1)
        if (self.fun) then
            self.fun(fc[1],fc._index)
        end
		fc[1].visible = true
		fc[2] = true
	end 
end 
-- 优化版使用
function t:moveChlidPosition(int_inToporDown)
	if self.type and self.type == 1 then 
		if self.Vertical then 
			local layer_child,firstIndex,lastIndex,space = self:preProcessSuper('y')
			if #layer_child < 1 then return end 
			local childInfo = layer_child[1][1]
			--竖：开始移到最后
			--if lastIndex < self._dataNum and self.content.y - childInfo[1].real_height() - space >= 0 then 
			if lastIndex < self._dataNum and int_inToporDown == 1 then -- 到最底
				self:super_start2tail(layer_child,lastIndex)
				self.content.y = self.content.y - self:getObjectHeight(childInfo) - space
			end
			if lastIndex >= self._dataNum then 
				self.inToporDown = int_inToporDown
			else
				self.inToporDown = 0
			end 
			--竖：最后移到开始
			--if firstIndex > 1 and self.content.y < 0 then 
			if firstIndex > 1 and int_inToporDown == -1 then
				self:super_tail2start(layer_child,firstIndex)
				self.content.y = self.content.y + space + self:getObjectHeight(layer_child[#layer_child][1]) 
			end
		end 

		if self.Horizontal then
			-- 水平方向预处理
			local layer_child,firstIndex,lastIndex,space = self:preProcessSuper('x')
			if #layer_child < 1 then return end 
			
			local childInfo = layer_child[1][1]

			--横：开始移到最后
			if lastIndex < self._dataNum and self.content.x < -(space + childInfo[1].real_width()) then 
				self:super_start2tail(layer_child,lastIndex)
				self.content.x = self.content.x + self.allChild[1][1].real_width() + space
			end
			
			--横：最后移到开始
			if firstIndex > 1 and self.content.x > 0 then 
				self:super_tail2start(layer_child,firstIndex)
				self.content.x = self.content.x - layer_child[#layer_child][1][1].real_width() - space
			end
		end 
	end 
end 
function t:getisbottom()
	if not self.layer_child  then 
		return  true 
	end 
	if not self:needSetPosition() then 
		return true 
	end 
	-- 是否占满了 实际个数少于控件个数
	if #self.layer_child > self._dataNum  then 
		if self.diffItemHigh and self._dataHeight then 
			local heightall = 0
			for i ,heig in pairs( self._dataHeight) do 
				heightall = heightall + heig
			end
			if #self._dataHeight > 1 then 
				if self.content.c_layout_h then 
					heightall = heightall + (self.content.c_layout_h.ColSpace or 0) * (#self._dataHeight - 1)
				elseif self.content.c_layout_v then 
					heightall = heightall + (self.content.c_layout_v.ColSpace or 0)* (#self._dataHeight - 1)
				end
			end
			if heightall < self.obj.real_height() then 
				return true 
			end  
		else
			return true 
		end
		--return false
	end 
	if self.contentmax_y and self.content.y then 
		if self.contentmax_y == self.content.y and self.lastIndex + #self.layer_child[1] > self._dataNum   then 
			self:preProcessSuper('y')
			if self.contentmax_y == self.content.y and self.lastIndex + #self.layer_child[1] > self._dataNum   then 
				return true 
			else
				return false
			end
		else
			return false
		end
	end
	return true 
end
function t:getContentRealHeight()
	if self.diffItemHigh then 
		-- 如果有不同高度的子 则返回所有子的高度和加上 间隔的高度和
		return self._allHeight + (self._dataNum - 1) * self.space 
	end
	local reallycontentHeight = self.content.real_height()
	if self.type and self.type == 1 and self.layer_child ~= nil then 
		local int_num = math.ceil(self.lastIndex / self.layer)
		if #self.layer_child > 1 then 
			reallycontentHeight = int_num * self:getObjectHeight(self.layer_child[1][1]) + (int_num - 1) * self.space
		else
			reallycontentHeight = 0
		end 
		
	end 
	return reallycontentHeight
end 
function t:setChildPosition(deltaX,deltaY)	
	if #self.allChild == 0 then return end 
	local int_inToporDown = 0
	--print('1',self.content.y,deltaY)
	if deltaY < 0 then 
		if self.type and self.type == 1 then 
			--print(self.allChild[1]._index,self.content.y , deltaY)
			if self.content.y + deltaY < 0 then 
				deltaY = -self.content.y
				int_inToporDown = -1 -- 到最顶
			end 
		else 
			if self.content.y + deltaY < 0 then 
				deltaY = -self.content.y
			end 
		end 
	end
	--print('2',self.content.y,deltaY)
	-- 到最底，防止继续往上拖动
	if deltaY > 0 and int_inToporDown == 0 then 
		local reallycontentHeight = self:getContentRealHeight()
		if reallycontentHeight < self.obj.real_height() and self.content.y > 0 then 
		elseif reallycontentHeight < self.obj.real_height() then 
			deltaY = 0
		elseif self.content.real_height() - self.content.y - deltaY <= self.obj.real_height() then 
			if self.type and self.type == 1 then 
				deltaY = (self.content.real_height() - self.content.y) - self.obj.real_height()
				int_inToporDown = 1 -- 到最底
			else
				deltaY = (self.content.real_height() - self.content.y) - self.obj.real_height()
			end
		end 
	end
	--print('3',self.content.y,deltaY)
	-- 到最左，防止继续往右拖动
	if self.type and self.type == 1 then 
		if self.allChild[1]._index == 1 and self.content.x + deltaX > 0 then 
			deltaX =  -self.content.x
		end 
	else 
		if self.content.x + deltaX > 0 then 
			deltaX =  -self.content.x
		end 
	end 

	-- 到最右，防止继续往左拖动
	if self.content.x + self.content.real_width() + deltaX <= self.mask.x + self.obj.real_width() then 
		deltaX = self.mask.x + self.obj.real_width() -(self.content.x + self.content.real_width() )
	end 
	-- 进行水平和垂直移动
	if self.Vertical then 
		self.content.y = self.content.y + deltaY
	end 
	if self.Horizontal then
		self.content.x = self.content.x + deltaX
	end 
	--end 
	-- 循环使用控件
	self:moveChlidPosition(int_inToporDown)
	self:isCanAutoMove()
	return deltaX,deltaY
end 
function t:needSetPosition()
	if self.type==1 then 
		self:getVisibleChild()
		--print(self._dataNum , self.visibleChildCount)
		if self._dataNum > self.visibleChildCount or self.content.y > 0 then 
			return true
		end 
	else 
		if (self.Vertical and self.content.real_height() > self.obj.real_height() ) or self.content.y > 0 then 
			return true
		end  
		if self.Horizontal and self.content.real_width() > self.obj.real_width() then 
			return true
		end 
	end
	return false
end 
function t:mouseWheelUp(tar)
	if self:needSetPosition() then 
		-- print(self.Sensitivity)
		-- self:setChildPosition(0,-self.Sensitivity)
		if self.type == 1 then 
			if not self.lineheight then 
				local layer_child,firstIndex,lastIndex,space = self:preProcessSuper('y')
				self.lineheight = self:getObjectHeight(self.allChild[1]) + space
			end
			local dis = self.Sensitivity
			while dis > 0 do
				-- body
				-- print('self.lineheight',dis,self.lineheight)
				self:setChildPosition(0,-self.lineheight)
				dis = dis - self.lineheight
			end
		else
			self:setChildPosition(0,-self.Sensitivity)
		end
		if self.callbackFunc then
			self.callbackFunc()
		end 
	end 
end 
function t:mouseWheelDown(tar)
	-- print('mouseWheelDown')
	if self:needSetPosition() then 
		-- print(self.Sensitivity)
		if self.type == 1 then 
			if not self.lineheight then 
				local layer_child,firstIndex,lastIndex,space = self:preProcessSuper('y')
				self.lineheight = self:getObjectHeight(self.allChild[1]) + space
			end
			local dis = self.Sensitivity
			while dis > 0 do
				-- body
				-- print('self.lineheight',dis,self.lineheight)
				self:setChildPosition(0,self.lineheight)
				dis = dis - self.lineheight
			end
		else
			self:setChildPosition(0,self.Sensitivity)
		end
		if self.callbackFunc then
			self.callbackFunc()
		end 
	end 
end 
function t:getAllChildren()
	self.allChild = {}
	local index= 1
	for i=0,self.content.childCount - 1  do
		
		local child = self.content.getChildAt(i)
		--if child and child.visible then 
		table.insert( self.allChild,{child,true,['_index']=index} )
		index = index + 1
		--end 
	end 
	return self.allChild
end 
function t:boundUpdated()
	if self.type ~= 1 then 
		self:getAllChildren()
	end 
	
	
	self:updateSlider()
	
	if self.autoMove == true and self.needAutoMove then 
		if self.Vertical then 
			self.content.y = self.content.real_height() - self.obj.real_height()
			if self.content.y < 0 then 
				self.content.y = 0
			end 
		end 
	end 
	
end 
function t:update()
	if self.active_time and self.active_time > 0 then 
		-- print('active',self.active_time)
		local change_y = self.active_y 
		local time_now =  os.clock() - self.mouseup_time
		if  time_now >=  self.SpeedMaxTime then 
			change_y = change_y * (self.SpeedMaxTime + self.SpeedecaytTime - time_now) /  self.SpeedecaytTime 
		end
		self:setChildPosition(0,change_y)
		self.active_time = self.SpeedMaxTime + self.SpeedecaytTime - time_now 
		if self.active_time <= 0 then 
			self.active_time = 0 
		end
		if self.final_pos then 
			if self.active_y > 0 then 
				--移动方向区分
				if self.final_pos == self.allChild[1]._index then 
					self.active_time = 0 
					self.final_pos = nil
					self.final_pos_old = nil
				end
			else
				if self.final_pos_old then 
					if self.final_pos_old ~= self.allChild[1]._index then 
						self.active_time = 0
						self.final_pos_old = nil
						self.final_pos = nil
					end
				elseif self.final_pos == self.allChild[1]._index then 
					self.final_pos_old = self.final_pos
				end
			end
		end
		if self.callbackFunc then
			self.callbackFunc()
		end 
		if self.type == 1 and self:getisbottom() then 
			self.active_time = 0 
			-- self.final_pos = nil
			-- self.final_pos_old = nil
		end
		if self.active_time == 0 then
			self.active_y = nil
			self.final_pos = nil
			self.final_pos_old = nil
		end
	-- elseif self.mousedown_time then 
	-- 	self.mousedown_time = os.clock()
	-- 	self.mousedown_x,self.mousedown_y = G.MousePos()
	end
	if G.MouseState() ~= 0 and self.state == 'down'	then 
		-- print(G.MouseState(), self.state ,'down')
		self:mouseUp()
	end 
	if self.state == 'down'	then 
		if self.callbackFunc then
			self.callbackFunc()
		end 
		local x,y = G.MousePos()
		self.mousedown_x, self.mousedown_y = x, y 
		if x ~= self.oldx or y ~= self.oldy then 
			self:selfmouseMove()
			self.oldx,self.oldy = x,y
		end 
		if self.callbackFunc then
			self.callbackFunc()
		end 
	end 
	-- 弹性效果

	if self.state == 'elastic' then 
		local x,y = G.MouseDelta()
		-- 进行水平和垂直移动
		if self.Vertical then 
			self.content.y = self.content.y + self.changeElastic
			-- math.max(self.changeElastic,0)
			self.changeElastic = self.changeElastic - 1
			if self.changeElastic <= 0 then 
				self.state = 'elasticOver'
				if self.elasticFunc then
					self.elasticFunc()
				end 
			end 
		end
	end 
end 
function t:mouseDown(tar)
	-- print('mouse down')
	if self.ignore then return end
	-- if self:needSetPosition() then G.SetFocus(self.obj)	 end
	if tar == self.slider_bt then 
		local x,y = G.MousePos()
		self.slider_y = y
	else
		self.active_time = 0
		self.mousedown_time = os.clock()
		self.mousedown_x,self.mousedown_y = G.MousePos()
	end 
	self.state = 'down'
	self.oldx,self.oldy = G.MousePos()
end 
function t:mouseUp(tar)
	-- print('mouse up')
	G.SetFocus()
	self.slider_y = nil
	if self.mousedown_time and self:needSetPosition() then 
		self.mouseup_time = os.clock()
		self.mouseup_x,self.mouseup_y = G.MousePos() 
		self:getactivemovepos()
	end
	if self.state == 'elastic' then 
		-- 复原
		self.content.y = self.content.real_height() - self.obj.real_height()
	end 
	self.state = 'up'
end 
function t:getactivemovepos(time,x,y)
	local change_time = self.mouseup_time - self.mousedown_time
	local change_x = (self.mouseup_x - self.mousedown_x)
	local change_y = (self.mouseup_y - self.mousedown_y)
	-- print(change_time,change_x,change_y,self.mouseup_time ,self.mousedown_time )
	-- if change_time > 0.5 or change_time  == 0 then return end 
	-- self.active_distancex = change_x *(0.5 / change_time) 
	-- self.active_distancey = change_y *(0.5 / change_time) 
	-- self.active_time = 30
	if math.abs(change_y) >= self.SpeedThreshold then 
		self.active_time = self.SpeedMaxTime + self.SpeedecaytTime 
		self.active_y = change_y 
	end

	self.mousedown_time = nil
end 
function t:isCanAutoMove()
	if math.abs(self.content.real_height() - (self.content.y + self.obj.real_height())) < 1  then 
		self.needAutoMove = true
	else 
		self.needAutoMove = false
	end 
end 
function t:selfmouseMove(tar)
	if self.ignore then return end
	if not self:needSetPosition() then return end
	local x,y = G.MouseDelta()	
	if self.slider_y then 
		local movedis = y/self.slider_bt.real_height()*self.obj.real_height() 
		if self.type == 1 then 
			local int_flag = 1
			if movedis < 0 then int_flag = -1 end
			local h = self:getObjectHeight(self.layer_child[1][1])/2
			movedis = math.abs(movedis)
			if movedis > h then 
				local int_count = movedis/h
				int_count = math.floor(int_count)
				for int_i=1, int_count do 
					self:setChildPosition(0,int_flag * h)
				end 
				self:setChildPosition(0,int_flag*(movedis - int_count * h))
			else
				self:setChildPosition(0,int_flag * movedis)
			end 
		else 
			self:setChildPosition(0,movedis)
		end 
		
	elseif self.state == 'down' then  
		local dx,dy = G.MouseDownDelta()
		if os.clock() - self.mousedown_time < 0.2 and dx * dx + dy * dy < 4 then 
			return 
		end 
		G.SetFocus(self.obj)
		local deltaX,deltaY = self:setChildPosition(-x,-y)
		if self.elastic and deltaY == 0 and y < 0 then 
			self.state = 'elastic'
			self.changeElastic = 15
		end 
	end 
	
end 
function t:setIgnored(boolean_ig)
	self.ignore = boolean_ig
	if boolean_ig == false then 
		self:mouseUp()
	end
end
function t:setElasticFunc(func)
	self.elasticFunc = func
end 
function t:setCallbackFunc(func)
	self.callbackFunc = func
end 

function t:resetPosition()
	if self.Vertical then 
		self.content.y = 0
	end  
	if self.Horizontal then 
		self.content.x = 0
	end  
end 

return t
