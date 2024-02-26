return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>o", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>s", ":Neotree filesystem close<CR>", {})
	end,
}
