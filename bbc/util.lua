-- 工具
-- yueqiumao (u2nn@qq.com)

-- 获取开机到现在经过的毫秒数
function millis()
    return rtos.tick() / (16384 / 1000)
end

