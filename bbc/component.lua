-- 组件类
-- yueqiumao (u2nn@qq.com)

Component = class("Component")

-- 组件启动优先级
SETUP_PRIORITY_IO = 10 -- GPIO初始化阶段
SETUP_PRIORITY_HARDWARE = 20 -- 硬件初始化阶段
SETUP_PRIORITY_GPRS = 30 -- GPRS附加阶段
SETUP_PRIORITY_AFTER_GPRS = 40 -- GPRS附加成功阶段
SETUP_PRIORITY_AFTER_CONNECTION = 50 -- 连接云端成功阶段
SETUP_PRIORITY_LATE = 60 -- 后续阶段

-- 组件构造
function Component:ctor()

end

-- 获取组件启动优先级
function Component:get_setup_priority()

end

-- 设置组件启动优先级
function Component:set_setup_priority(priority)

end

-- 组件启用
function Component:setup()

end

-- 组件主循环
function Component:loop()

end

-- 组件关闭
function Component:shutdown()

end