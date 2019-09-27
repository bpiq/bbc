-- 主入口
-- yueqiumao (u2nn@qq.com)

PROJECT = "BBC"
VERSION = "0.0.1"
PRODUCT_KEY = "v32xEAKsGTIEQxtqgwCldp5aPlcnPs3K"

require "sys"

require "util"
require "class"
require "component"
require "logger"
require "event"
require "network"
require "application"
require "status_led"

local did = 10001 -- 设备编号
local token = "hellohelloballcat" -- 设备令牌
local model = "com.ball.car" -- 设备类型

local function task_main()
    local app = Application.new()

    -- 基础配置
    app:pre_setup({
        did=did,
        token=token,
        model=model,
        version=VERSION
    })

    -- 注册日志模块
    local logger = Logger.new()
    logger:pre_setup()
    app:register_component(logger)

    -- 注册led模块
    local status_led = StatusLed.new()
    status_led:pre_setup()
    app:register_component(status_led)

    app:setup()

    while true do
        app:loop()
        sys.wait(16)
    end
end

local function main()
    sys.init(0)
    sys.taskInit(task_main)
    sys.run()
end
main()