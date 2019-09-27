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

-- 组件状态
COMPONENT_STATE_MASK = 0xFF;
COMPONENT_STATE_CONSTRUCTION = 0x00;
COMPONENT_STATE_SETUP = 0x01;
COMPONENT_STATE_LOOP = 0x02;
COMPONENT_STATE_FAILED = 0x03;
STATUS_LED_MASK = 0xFF00
STATUS_LED_OK = 0x0000
STATUS_LED_WARNING = 0x0100
STATUS_LED_ERROR = 0x0200

-- 组件构造
function Component:ctor()
    self.component_state = 0x0000
end

-- 获取组件启动优先级
function Component:get_setup_priority()
    return SETUP_PRIORITY_GPRS
end

-- 获取组件循环优先级
function Component:get_loop_priority()
    return SETUP_PRIORITY_GPRS
end

-- 获取组件当前状态
function Component:get_component_state()
    return self.component_state
end

-- 组件启动
function Component:setup()

end

-- 组件主循环
function Component:loop()

end

-- 组件调度
function Component:call()
    local state = bit.band(self.component_state, COMPONENT_STATE_MASK)
    if state == COMPONENT_STATE_CONSTRUCTION then
        self.component_state = bit.band(self.component_state, bit.bnot(COMPONENT_STATE_MASK))
        self.component_state = bit.bor(self.component_state, COMPONENT_STATE_SETUP)
        self:setup()
    elseif state == COMPONENT_STATE_SETUP then
        self.component_state = bit.band(self.component_state, bit.bnot(COMPONENT_STATE_MASK))
        self.component_state = bit.bor(self.component_state, COMPONENT_STATE_LOOP)
        self:loop()
    elseif state == COMPONENT_STATE_LOOP then
        self:loop()
    elseif state == COMPONENT_STATE_FAILED then

    else

    end
end

-- 组件关闭
function Component:shutdown()

end

-- 标记组件为 failed 将不再处理 loop
function Component:mark_failed()
    self.component_state = bit.band(self.component_state, bit.bnot(COMPONENT_STATE_MASK))
    self.component_state = bit.bor(self.component_state, COMPONENT_STATE_FAILED)
    self:status_set_error()
end

function Component:is_failed()
    return bit.band(self.component_state, COMPONENT_STATE_MASK) == COMPONENT_STATE_FAILED
end

function Component:can_proceed() 
    return true
end

function Component:status_has_warning()
    return bit.band(self.component_state, STATUS_LED_WARNING) == STATUS_LED_WARNING
end

function Component:status_has_error()
    return bit.band(self.component_state, STATUS_LED_ERROR) == STATUS_LED_ERROR
end

function Component:status_set_warning() 
    self.component_state = bit.bor(self.component_state, STATUS_LED_WARNING)
    app.app_state = bit.bor(app.app_state, STATUS_LED_WARNING)
end

function Component:status_set_error()
    self.component_state = bit.bor(self.component_state, STATUS_LED_ERROR)
    app.app_state = bit.bor(app.app_state, STATUS_LED_ERROR)
end

function Component:status_clear_warning()
    self.component_state = bit.band(self.component_state, bit.bnot(STATUS_LED_WARNING))
end

function Component:status_clear_error()
    self.component_state = bit.band(self.component_state, bit.bnot(STATUS_LED_ERROR))
end
