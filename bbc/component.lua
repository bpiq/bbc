-- 组件类
-- yueqiumao (u2nn@qq.com)

Component = class("Component")

-- 组件启动优先级
SETUP_PRIORITY_IO = 10 -- GPIO初始化阶段
SETUP_PRIORITY_HARDWARE = 20 -- 硬件初始化阶段
SETUP_PRIORITY_GPRS = 30 -- GPRS附加阶段 (默认)
SETUP_PRIORITY_AFTER_GPRS = 40 -- GPRS附加成功阶段
SETUP_PRIORITY_AFTER_CONNECTION = 50 -- 连接云端成功阶段
SETUP_PRIORITY_LATE = 60 -- 后续阶段

-- 状态led
STATUS_LED_MASK = 0xFF00
STATUS_LED_OK = 0x0000
STATUS_LED_WARNING = 0x0100
STATUS_LED_ERROR = 0x0200

-- 组件构造
function Component:ctor()
    self.setup_priority = SETUP_PRIORITY_GPRS
end

-- 获取组件启动优先级
function Component:get_setup_priority()
    return self.setup_priority
end

-- 设置组件启动优先级
function Component:set_setup_priority(priority)
    self.setup_priority = priority
end

-- 获取组件循环优先级
function Component:get_loop_priority()
    return SETUP_PRIORITY_GPRS
end

-- 组件启动
function Component:setup()

end

-- 组件主循环
function Component:loop()

end

-- 组件关闭
function Component:shutdown()

end