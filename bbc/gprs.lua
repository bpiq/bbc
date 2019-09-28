-- 管理gprs网络
-- yueqiumao (u2nn@qq.com)

Gprs = class("Gprs", Component)

local TAG = "Gprs"

function Gprs:setup()
    logger:info(TAG, "GPRS组件启动")
    
    -- 设置状态LED
    -- self:status_set_warning()

    --每1分钟查询一次GSM信号强度
    --每1分钟查询一次基站信息
    net.startQueryAll(60000, 60000)
end

function Gprs:loop()
    
end

function Gprs:can_proceed()
    return link.isReady()
end