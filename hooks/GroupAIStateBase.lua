function GroupAIStateBase:begin_gameover_fadeout()
    managers.hud:set_disabled()
    local element = managers.mission:get_mission_element(101184)
    element:on_executed()
end