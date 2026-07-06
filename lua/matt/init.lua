require("matt.set")
require("matt.remap")

require("matt.lazy_init")

local augroup = vim.api.nvim_create_augroup
local MattGroup = augroup("matt", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWritePre" }, {
	group = MattGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("LspAttach", {
	group = MattGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation()
		end, opts)
		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("v", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)

		local client = vim.lsp.get_client_by_id(e.data.client_id)
		if client and client.name == "biome" then
			vim.keymap.set("n", "<leader>vf", function()
				vim.lsp.buf.code_action({
					context = { only = { "source.fixAll.biome" }, diagnostics = {} },
					apply = true,
				})
			end, vim.tbl_extend("force", opts, { desc = "Biome: apply safe fixes" }))
			vim.keymap.set("n", "<leader>vo", function()
				vim.lsp.buf.code_action({
					context = { only = { "source.organizeImports.biome" }, diagnostics = {} },
					apply = true,
				})
			end, vim.tbl_extend("force", opts, { desc = "Biome: organize imports" }))
		end
	end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
