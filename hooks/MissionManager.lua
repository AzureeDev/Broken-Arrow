local Path = ZM_BANK.ModPath

dofile(Path .. "hooks/ElementWeaponSwitch.lua")
dofile(Path .. "hooks/ElementPointChecker.lua")
dofile(Path .. "hooks/ElementWave.lua")
dofile(Path .. "hooks/ElementAnnouncerGift.lua")
dofile(Path .. "hooks/ElementDynamicEnvironment.lua")
dofile(Path .. "hooks/ElementPlayVideo.lua")
dofile(Path .. "hooks/ElementXAudio.lua")
dofile(Path .. "hooks/ElementSpawnSafeEnemyDummy.lua")
dofile(Path .. "hooks/ElementSoraCinematicCamera.lua")
dofile(Path .. "hooks/ElementReviveInstigator.lua")

function MissionManager:get_mission_element(element_id)
	for _, data in pairs(self._scripts) do
		for id, element in pairs(data:elements()) do
			if element:id() == element_id then
				return element
			end
		end
	end
end
