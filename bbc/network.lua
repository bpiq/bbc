Network = class("Network", Component)

function Network:ctor()

end

function Network:get_setup_priority()
    return SETUP_PRIORITY_AFTER_GPRS
end

function Network:set_setup_priority()
end

function Network:begin()

end

function Network:loop()

end

function Network:shutdown()

end

function Network:destroy()

end