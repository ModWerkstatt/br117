function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "train", "siemens", "electric", "multi-system", "universal", "es64f4" },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },
        params = {
			{
				key = "br117_vorspann",
				name = _("Vorspann_br117"),
				values = { "No", "Yes", },
				tooltip = _("option_vorspann_br117_desc"),
				defaultIndex = 0,
			},
			{
				key = "br117_fake",
				name = _("Fake_br117"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_br117_desc"),
				defaultIndex = 0,
			},
        },
	},
	options = {
	},
	runFn = function (settings, modParams)

		local vorspannFilter = function(fileName, data)
			if data.metadata.transportVehicle and data.metadata.br117 and data.metadata.br117.vorspann == true then
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
				--return false
			end
			--return true
			return data
		end

		local fakeFilter = function(fileName, data)
			if data.metadata.transportVehicle and data.metadata.br117 and data.metadata.br117.fake == true then
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
			end
			return data
		end

		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["br117_vorspann"] == 0 then
				--addFileFilter("model/transportVehicle", vorspannFilter)
				addModifier("loadModel", vorspannFilter)
			end
			if params["br117_fake"] == 0 then
				addModifier("loadModel", fakeFilter)
			end

		else
			--addFileFilter("model/transportVehicle", vorspannFilter)
			addModifier("loadModel", fakeFilter)
		end
	end
}
end
