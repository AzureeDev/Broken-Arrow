function GroupAIStateBase:begin_gameover_fadeout()
    managers.hud:init_ending_screen()
    managers.statistics:send_zm_stats()
    local element = managers.mission:get_mission_element(101184)
    element:on_executed()
end