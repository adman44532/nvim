local M = {}

function M.is_nixos()
	return vim.fn.isdirectory '/etc/nixos' == 1 or vim.fn.isdirectory '/nix/var/nix/profiles/system' == 1
end

function M.has_command(cmd)
	return vim.fn.executable(cmd) == 1
end

function M.has_npm()
	return M.has_command('npm')
end

function M.has_make()
	return M.has_command('make')
end

return M
