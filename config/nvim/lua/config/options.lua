local options = {
	number = true,
	relativenumber = true,
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	backup = false,
	hlsearch = true,
	scrolloff = 10,
	smartcase = true,
	smartindent = true,
	softtabstop = 2,
	wildmenu = true,
	writebackup = false,
	clipboard = 'unnamedplus',
	wrap = false,
}

for k, v in pairs (options) do
	vim.opt[k] = v
end
