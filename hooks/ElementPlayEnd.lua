core:import("CoreMissionScriptElement")
ElementPlayEnd = ElementPlayEnd or class(CoreMissionScriptElement.MissionScriptElement)

function ElementPlayEnd:init(...)
	ElementPlayEnd.super.init(self, ...)
end
function ElementPlayEnd:client_on_executed(...)
	self:on_executed(...)
end

function ElementPlayEnd:on_executed(instigator)

	if not self._values.enabled then
		self._mission_script:debug_output("Element '" .. self._editor_name .. "' not enabled. Skip.", Color(1, 1, 0, 0))
		return
	end

	if instigator == managers.player:player_unit() then
		managers.wdu:_play_the_end()
	end

	ElementPlayEnd.super.on_executed(self, instigator)
end

function ElementPlayEnd:on_script_activated()
    self._mission_script:add_save_state_cb(self._id)
end

function ElementPlayEnd:save(data)
    data.save_me = true
    data.enabled = self._values.enabled
end

function ElementPlayEnd:load(data)
    self:set_enabled(data.enabled)
end
