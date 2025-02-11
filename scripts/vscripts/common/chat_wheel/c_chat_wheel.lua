if ClientChatWheel == nil then ClientChatWheel = class({}) end

function ClientChatWheel:Start()
	ListenToGameEvent("pf_wheel", Dynamic_Wrap(ClientChatWheel, 'HandleWheel'), self)
	ListenToGameEvent("pf_wheel_alt", Dynamic_Wrap(ClientChatWheel, 'HandleWheelAlt'), self)
end

function ClientChatWheel:HandleWheel(params)
	if params.type == 1 then
		SendToConsole("+herochatwheel")
	else
		SendToConsole("-herochatwheel")
	end
end

function ClientChatWheel:HandleWheelAlt(params)
	if params.type == 1 then
		SendToConsole("+chatwheel2")
	else
		SendToConsole("-chatwheel2")
	end
end

ClientChatWheel:Start()