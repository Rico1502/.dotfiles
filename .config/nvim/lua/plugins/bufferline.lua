return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local bufferline = require("bufferline")

			bufferline.setup({
				options = {},
			})

			vim.keymap.set("n", "<leader>bb", "<CMD>BufferLinePick<CR>")
			vim.keymap.set("n", "<leader>ts", "<CMD>BufferLinePickClose<CR>")
			vim.keymap.set("n", "<C-l>", "<CMD>BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<C-h>", "<CMD>BufferLineCyclePrev<CR>")
			vim.keymap.set("n", "]b", "<CMD>BufferLineMoveNext<CR>")
			vim.keymap.set("n", "[b", "<CMD>BufferLineMovePrev<CR>")
			vim.keymap.set("n", "<leader>bs", "<CMD>BufferLineSortByDirectory<CR>")
      vim.keymap.set("n", "<leader>bc", "<CMD>BufferLineCloseOthers<CR>")
		end,
	},
}
