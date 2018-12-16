function RaycastWeaponBase:reload_speed_multiplier()
	local multiplier = 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "reload_speed_multiplier", 1)
	end

	multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)
	multiplier = multiplier * (managers.player:has_special_equipment("perk_speedcola") and 2 or 1)

	return multiplier
end

function RaycastWeaponBase:fire_rate_multiplier()
	local multiplier = 1
	multiplier = multiplier * (managers.player:has_special_equipment("perk_doubletap") and 1.25 or 1)

	return multiplier
end

function RaycastWeaponBase:damage_multiplier()
	local multiplier = 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "damage_multiplier", 1)
	end

	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "damage_multiplier", 1)
	multiplier = multiplier * (managers.player:has_special_equipment("perk_doubletap") and 1.25 or 1)

	return multiplier
end

Hooks:PostHook(RaycastWeaponBase, "init", "zm_init_pap_sound", function(self)
    self._pap_sound = SoundDevice:create_source("zm_pap_sound")

    if alive(self._setup.user_unit) then
        self._pap_sound:set_position(self._setup.user_unit:position())
    end

    self.allowed_categories = {}

    for _, category in ipairs({
        "assault_rifle",
        "snp",
        "lmg",
        "smg",
        "pistol",
        "akimbo",
        "revolver",
        "shotgun"
    }) do
        self.allowed_categories[category] = true
    end -- made allowed_categories into a set that holds each category as a key.
end)

Hooks:PostHook(RaycastWeaponBase, "fire", "zm_pap_sound_click", function(self)
    if not self._pap_sound then
        self:_force_init_sound_device_fucking_conflicts_lol()
    end

    local pass = false

    for _, category in ipairs(self:weapon_tweak_data().categories) do
        if self.allowed_categories[category] == true then
            pass = true
            break
        end
    end -- checking if the weapon's category is allowed, but, instead of comparing values with a second loop, it checks if the category is set to true in allowed_categories.

    if pass then
        if string.find(self._name_id, "_upg_") then -- replaced the threshold variable with 4 because it was only being used here.
            self._pap_sound:post_event("zm_pew_global")
        end
    end
end)

function RaycastWeaponBase:_force_init_sound_device_fucking_conflicts_lol()
    self._pap_sound = SoundDevice:create_source("zm_pap_sound")

    if alive(self._setup.user_unit) then
        self._pap_sound:set_position(self._setup.user_unit:position())
    end
end
