-- Define a function to toggle undotree
local function toggleUndotree()
	vim.cmd.UndotreeToggle()
	vim.cmd.UndotreeFocus()
end

-- Configuration
return {
	"mbbill/undotree",
	keys = {
		{
			"U",
			toggleUndotree,
			desc = "open undotree ui",
			mode = "n",
		},
	},
}
