Hooks:PostHook(HuskCopDamage, "die", "post_init_die_cop_husk", function(self)
	if alive(self._unit:base()._headwear_unit) then
		self._unit:base()._headwear_unit:set_slot(0)
	end
end)