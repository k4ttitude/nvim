return {
	"mistricky/codesnap.nvim",
	build = "make",
	keys = {
		{ "<leader>cs", "<Esc><cmd>CodeSnap<cr>", mode = "x", desc = "Snapshot and copy into clipboard" },
	},
	opts = {
		watermark = "",
		has_line_number = true,
		has_breadcrumbs = true,
		bg_padding = 0,
	},
}
