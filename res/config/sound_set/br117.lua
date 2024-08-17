local soundsetutil = require "soundsetutil"

function data()

local data = soundsetutil.makeSoundSet()
		
soundsetutil.addTrackParam01
(data, "vehicle/train/br117/117_idle.wav", 25.0,
		{
			{ 0.0, 1.0 },
			{ 0.01, 1.0 },
			{ 0.1, 0.0 } },
		{
			{ 0.0, 1.0 },
			{ 1.0, 1.0 } }, 
		"speed01")

		
soundsetutil.addTrackParam01
(data, "vehicle/train/br117/117_grummeln.wav", 25.0,
		{
			{ 0.00, 0.0},
			{ 0.01, 0.8},
			{ 0.10, 0.9},
			{ 0.18, 1.0},
			{ 0.181, 0.0},
			{ 1.00, 0.0},
			
		},
		{
			{ 0.0, 0.9 }, 
			{ 1.0, 1.0 } 
		}, 
		"speed01")	
		
		
soundsetutil.addTrackParam01
(data, "vehicle/train/br117/117_fahren.wav", 25.0,
		{
			{ 0.00, 0.0},
			{ 0.01, 0.0},
			{ 0.15, 0.5},
			{ 0.30, 1.0},
			{ 1.00, 1.3},
			
		},
		{
			{ 0.0, 0.9 }, 
			{ 1.0, 1.2 } 
		}, 
		"speed01")
		
soundsetutil.addEvent(data, "horn", { "vehicle/train/br117/117_horn.wav" }, 25.0)

soundsetutil.addTrackSqueal(data, "vehicle/train/br117/kurve.wav", 25.0)
soundsetutil.addTrackBrake(data, "vehicle/train/br117/bremsen.wav", 25.0, 1.0)

return data

end
