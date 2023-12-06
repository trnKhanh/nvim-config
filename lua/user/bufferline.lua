local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
	},
})
