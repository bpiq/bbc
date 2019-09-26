-- 应用类
-- yueqiumao (u2nn@qq.com)

Application = class("Application")

app = nil

function Application:ctor()
    app = self
end

-- 系统预初始化
function Application:pre_setup(node_info)
    print(node_info)
end

-- 系统启用
function Application:setup()
    
end

-- 系统主循环
function Application:loop()

end

function Application:destroy()

end