Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

require("zoxide"):setup {
	update_db = true,
}

require("smart-enter"):setup {
	open_multi = true,
}

require("toggle-pane"):entry("min-preview")

require("git"):setup()

require("bookmarks"):setup {
	last_directory = { enable = true, mode = "dir" },
	persist = "all",
	desc_format = "full",
	file_pick_mode = "parent",
	custom_desc_input = true,
	show_keys = true,
	notify = {
		enable = true,
		timeout = 2,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
		},
	},
}
