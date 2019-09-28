-- 看门猫
-- yueqiumao (u2nn@qq.com)

Watchcat = class("Watchcat", Component)

local TAG = "Watchcat"

function Watchcat:setup()
    logger:info(TAG, "看门猫组件启动")
    -- wdt.setup(pio.P0_30, pio.P0_31)
end

function Watchcat:loop()

end