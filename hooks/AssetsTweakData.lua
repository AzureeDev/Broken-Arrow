Hooks:PostHook(AssetsTweakData, "_init_assets", "zm_init_assets", function(self, tweak_data)
    self.zm_broken_arrow_perks = {
		name_id = "zm_broken_arrow_perks_name",
		texture = "map_assets/perks",
		stages = {"zm_broken_arrow"},
		no_mystery = true
	}
end)

Hooks:PostHook(AssetsTweakData, "_init_risk_assets", "zm_ignore_risk_asset", function(self, tweak_data)
    table.insert(self.risk_pd.exclude_stages, "zm_broken_arrow")
    table.insert(self.risk_swat.exclude_stages, "zm_broken_arrow")
    table.insert(self.risk_fbi.exclude_stages, "zm_broken_arrow")
    table.insert(self.risk_death_squad.exclude_stages, "zm_broken_arrow")
    table.insert(self.risk_easy_wish.exclude_stages, "zm_broken_arrow")
    table.insert(self.risk_death_wish.exclude_stages, "zm_broken_arrow")
    table.insert(self.risk_sm_wish.exclude_stages, "zm_broken_arrow")
end)

Hooks:PostHook(AssetsTweakData, "_init_gage_assets", "zm_ignore_gage_asset", function(self, tweak_data)
    table.insert(self.gage_assignment.exclude_stages, "zm_broken_arrow")
end)