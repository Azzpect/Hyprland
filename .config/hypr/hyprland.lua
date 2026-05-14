require("conf/binds")
require("conf/style")
require("conf/startup")
require("conf/rules")

-- monitor
hl.monitor({
	output = "",
	mode = "1920x1080@60",
	position = "auto",
	scale = "auto",
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
