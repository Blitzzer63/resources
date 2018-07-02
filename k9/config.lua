K9Config = {}
K9Config = setmetatable(K9Config, {})

K9Config.OpenMenuIdentifierRestriction = true
K9Config.OpenMenuPedRestriction = true
K9Config.LicenseIdentifiers = {
	"license:f738d51d78c1ae12ac812b05e69d9f75bc25b179"
}
K9Config.SteamIdentifiers = {
	"steam:11000010494667b"
}
K9Config.PedsList = {
	"s_m_y_cop_01",
	"s_m_y_sheriff_01"
}

-- Restricts the dog to getting into certain vehicles
K9Config.VehicleRestriction = false
K9Config.VehiclesList = {
	
}

-- Searching Type ( RANDOM [AVAILABLE] | VRP [NOT AVAILABLE] | ESX [NOT AVAILABLE] )
K9Config.SearchType = "Random"
K9Config.OpenDoorsOnSearch = false

-- Used for Random Search Type --
K9Config.Items = {
	{item = "Cocaine", illegal = true},
	{item = "Marijuana", illegal = true},
	{item = "Blunt Spray", illegal = false},
	{item = "Crowbar", illegal = false},
	{item = "Lockpicks", illegal = false},
	{item = "Baggies", illegal = false},
	{item = "Used Needle", illegal = false},
	{item = "Open Container", illegal = false},
}

-- Language --
K9Config.LanguageChoice = "English"
K9Config.Languages = {
	["English"] = {
		follow = "Come",
		stop = "Heel",
		attack = "Bite",
		enter = "In",
		exit = "Out"
	}
}