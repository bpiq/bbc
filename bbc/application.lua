-- 应用类
-- yueqiumao (u2nn@qq.com)

Application = class("Application")

local TAG = "Application"

app = nil

function Application:ctor()
    app = self
    self.components = {}
    self.app_state = 0
end

-- 系统预初始化
function Application:pre_setup(node_info)
    self.node_info = node_info
end

-- 系统启用
function Application:setup()
    logger:info(TAG, string.format("BBC v%s 启动", self.node_info.version))

    table.sort(self.components, function(a, b) return a:get_setup_priority() < b:get_setup_priority() end)

    for i,v in ipairs(self.components) do
        v:call()
        -- 组件尚未处理完毕，对已完毕的组件开启工作流程，直到当前组件完毕
        if not v:can_proceed() then
            -- TODO 对组件进行工作流程优先级排序
            repeat
                local new_app_state = STATUS_LED_WARNING
                for ii = 1, i do
                    local vv = self.components[ii];
                    vv:call()
                    new_app_state = bit.bor(new_app_state, vv:get_component_state())
                    self.app_state = bit.bor(self.app_state, new_app_state)
                end
                self.app_state = new_app_state
                sys.wait(16)
            until v:can_proceed()
        end
    end

    -- TODO 对组件进行工作流程优先级排序
end

-- 系统主循环
function Application:loop()
    local new_app_state = 0
    for i,v in ipairs(self.components) do
        v:call()
        new_app_state = bit.bor(new_app_state, v:get_component_state())
        self.app_state = bit.bor(self.app_state, new_app_state)
    end
    self.app_state = new_app_state
end

function Application:shutdown()

end

function Application:reboot()

end

function Application:get_app_state()
    return self.app_state
end

function Application:register_component(component)
    for i,v in ipairs(self.components) do
        if v == component then
            return
        end
    end
    table.insert(self.components, component)
end