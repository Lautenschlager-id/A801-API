local account = load(io.open("account", 'r'):read("*a"))()

local api = require("../api")

coroutine.wrap(function()
	local client = api()
	client.connect(account.username, account.password)
	
	if client.isConnected() then
		-- TODO
	end

	client.disconnect()
	os.execute("pause >nul")
end)()