-- 负责与服务器交互
-- yueqiumao (u2nn@qq.com)

Network = class("Network", Component)

local TAG = "Network"

function Network:get_setup_priority()
    return SETUP_PRIORITY_AFTER_GPRS
end

function Network:set_setup_priority()
end

function Network:begin()
    logger:info(TAG, "网络组件启动")
end

function Network:loop()

end

function Network:shutdown()

end

function Network:destroy()

end