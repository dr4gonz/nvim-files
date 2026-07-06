return {
	"nvimdev/dashboard-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					"",
					"",
					"",
					"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
					"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
					"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
					"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
					"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
					"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
					"",
					"",
				},
				center = {
					{
						icon = "  ",
						desc = "New File",
						key = "e",
						action = "ene | startinsert",
					},
					{
						icon = "  ",
						desc = "Find File",
						key = "f",
						action = "Telescope find_files",
					},
					{
						icon = "  ",
						desc = "Recent Files",
						key = "r",
						action = "Telescope oldfiles",
					},
					{
						icon = "  ",
						desc = "Live Grep",
						key = "g",
						action = "Telescope live_grep",
					},
					{
						icon = "  ",
						desc = "Quit",
						key = "q",
						action = "qa",
					},
				},
				footer = {},
			},
		})
	end,
}
