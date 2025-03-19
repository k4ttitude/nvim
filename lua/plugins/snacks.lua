return {
	"snacks.nvim",
	opts = {
		scroll = {
			enabled = true,
			animate = {
				duration = { step = 5, total = 100 },
				easing = "linear",
			},
			-- faster animation when repeating scroll after delay
			animate_repeat = {
				delay = 100, -- delay in ms before using the repeat animation
				duration = { step = 3, total = 60 },
				easing = "linear",
			},
		},
	},
}
