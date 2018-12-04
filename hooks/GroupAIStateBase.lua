function GroupAIStateBase:begin_gameover_fadeout()
    managers.hud:init_ending_screen()
    local element = managers.mission:get_mission_element(101184)
    element:on_executed()
end