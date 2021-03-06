local api = require("fromage")
local client = api()
local enumerations = client.enumerations()

coroutine.wrap(function()
	client.connect("Username#0000", "password")
	
	if client.isConnected() then
		local location, result, err

		location, result = client.createPrivateMessage("Bolodefchoco#0000", "PM", "[b]hahaha[/b]ha!") -- Creates a private message
		print("Answering private message:")
		if location then
			print(client.answerConversation(location.data.co, "Nice forum!?")) -- Answers the private message

			print("Private message:")
			local pm
			pm, err = client.getConversation(location.data) -- Gets the private message data
			if pm then
				p(pm)
			else
				print(err)
			end
		else
			print(result)
		end

		local time = os.time() + 10 -- 10 seconds
		while os.time() < time do end

		location, result = client.createPrivateDiscussion({ "Bolodefchoco#0000", "+Bolodefchoco#0000" }, "Conversation", "We're all noobs. [quote=Life]True[/quote]")
		if location then
			print("Inviting someone to the conversation:")
			print(client.conversationInvite(location.data.co, "Boloprivate#0000")) -- Invites someone

			print("Kicking someone from the conversation:")
			print(client.kickConversationMember(location.data.co, "+Bolodefchoco#0000")) -- Kicks someone

			print("Locking the conversation:")
			print(client.changeConversationState(enumerations.displayState.locked, location.data.co)) -- Locks the discussion

			print("Leaving the conversation:")
			print(client.leaveConversation(location.data.co)) -- Leaves the discussion

			print("Moving the conversation:")
			print(client.moveConversation(enumerations.inboxLocale.archives, location.data.co)) -- Puts the discussion in the archives

			print("Getting private conversation:")
			local conv
			conv, err = client.getConversation(location.data) -- Gets the private conversation data
			if conv then
				p(conv)

				print("Getting message data:")
				local message
				message, err = client.getMessage('1', location.data) -- conv.firstMessage, gets the data of a message
				if message then
					p(message)
				else
					print(err)
				end
			else
				print(err)
			end
		else
			print(result)
		end
	end

	client.disconnect()
	os.execute("pause >nul")
end)()