-- 主入口
-- yueqiumao (u2nn@qq.com)

require "class"
require "logger"
require "event"
require "component"
require "util"
require "network"
require "application"

local did = 10001 -- 设备编号
local token = "hellohelloballcat" -- 设备令牌
local model = "com.ball.car" -- 设备类型

function main()
    local app = Application.new()
    
    app:pre_setup({
        did=did,
        token=token,
        model=model
    })

    app:setup()

    while true do
        app:loop()
    end
end

main()