-- 应用类
-- yueqiumao (u2nn@qq.com)

Gprs = class("Gprs", Component)

function Gprs:setup()
    logger:info("GPRS模块启动")
    
    -- 设置状态LED
    self:status_set_warning()

    --每1分钟查询一次GSM信号强度
    --每1分钟查询一次基站信息
    -- net.startQueryAll(60000, 60000)
end

function Gprs:loop()
    
end