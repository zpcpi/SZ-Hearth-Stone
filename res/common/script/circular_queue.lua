local Q = {}

function Q:create(size)
	local o = {}
	self.__index = self
	setmetatable(o, self)
	o.maxsize = size
	o.front = 0
	o.rear = 0
	o.msg = {}
	return o
end

function Q:isEmpty()
	return self.front == self.rear
end

function Q:isFull()
	return self.front == (self.rear + 1) % self.maxsize
end

function Q:push(data)
	if self:isFull() then
		return 'queue is full'
	end
	self.msg[self.rear] = data
	self.rear = (self.rear + 1) % self.maxsize
end

function Q:pop()
	if self:isEmpty() then
		return
	end
	local data = self.msg[self.front]
	self.front = (self.front + 1) % self.maxsize
	return data
end

function Q:size()
	return (self.rear - self.front) % self.maxsize
end

return Q
