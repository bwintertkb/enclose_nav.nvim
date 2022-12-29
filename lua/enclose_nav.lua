ENCLOSING_SYMBOL = {")", "]", "\'", "\"", "}", ">"}

function inside_list(list, value) 
	for _, v in ipairs(list) do
		if v == value then
			return true
		end
	end
	return false
end

function enclose_nav()
	-- get the current cursor position
	local cursor_pos = vim.api.nvim_win_get_cursor(0);
	local line = vim.api.nvim_buf_get_lines(0, cursor_pos[1]-1, cursor_pos[1], false)[1]
	-- flag indicating if we are inside enclosing parens or brackets, or other supported symbol
	-- iterate over the characters in the line
	for i = cursor_pos[2] + 2, #line do
		local char = line:sub(i, i)
		if inside_list(ENCLOSING_SYMBOL, char) then
			-- move the cursor to the position of the closing token 
			vim.api.nvim_win_set_cursor(0, {cursor_pos[1], i - 1})
			break
		end
	end
end

M = {}

M.setup = function()
	-- Set the keybinding for the enclose_nav function in insert mode
	vim.api.nvim_set_keymap("i", "<C-e>", "<ESC>:lua enclose_nav()<CR>a", {noremap = true})
end

return M
