local script = require('scriptcomponent'):derive()

function script:onkeyboard(buffer)
	if buffer == 'g' then
		getcomponent(self.entity, "animatedsprite").name = 'ninjagirl/Glide'
	end
	if buffer == 'd' then
		getcomponent(self.entity, "animatedsprite").name = 'ninjagirl/Dead_'
	end
	if buffer == 'j' then
		getcomponent(self.entity, "animatedsprite").name = 'ninjagirl/Jump_Attack_'
	end
	if buffer == 'i' then
		getcomponent(self.entity, "animatedsprite").name = 'ninjagirl/Idle_'
	end
	if buffer == 'r' then
		getcomponent(self.entity, "animatedsprite").name = 'ninjagirl/Run_'
	end
end

function script:oninit()
	self.super:oninit()

	self.space_button = Input:getbuttonidforname(" ")
	self.left_button = Input:getbuttonidforname("LEFT")
	self.right_button = Input:getbuttonidforname("RIGHT")
	self.up_button = Input:getbuttonidforname("UP")
	self.down_button = Input:getbuttonidforname("DOWN")
	self.state = 'idle'

	self:start_coroutine(function()
		while(true) do
			if (Input:getbutton(self.left_button) == 2) then
				getcomponent(self.entity, "transform"):scale(vec3(-1.0, 1.0, 1.0))
 			end

			if (Input:getbutton(self.right_button) == 2) then
				getcomponent(self.entity, "transform"):scale(vec3(-1.0, 1.0, 1.0))
 			end

 			if (Input:getbutton(self.space_button) == 2) then
	 			getcomponent(self.entity, "animatedsprite").name = 'ninjagirl/Jump_Attack_'
			end

			yield()
		end
	end)
end

return script
