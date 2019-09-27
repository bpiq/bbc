-- 应用类
-- yueqiumao (u2nn@qq.com)

Application = class("Application")

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
    logger:info(string.format("BBC v%s 启动", self.node_info.version))

    table.sort(self.components, function(a, b) return a:get_setup_priority() < b:get_setup_priority() end)

    for i,v in ipairs(self.components) do
        v:setup()
    end
end

-- 系统主循环
function Application:loop()
    for i,v in ipairs(self.components) do
        v:loop()
    end
    self.app_state = STATUS_LED_ERROR
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