-- 主入口
-- yueqiumao (u2nn@qq.com)

PROJECT = "BBC"
VERSION = "1.0.0"
PRODUCT_KEY = "v32xEAKsGTIEQxtqgwCldp5aPlcnPs3K"

require "sys"

require "class"
require "component"
require "logger"
require "event"
require "util"
require "network"
require "application"

local did = 10001 -- 设备编号
local token = "hellohelloballcat" -- 设备令牌
local model = "com.ball.car" -- 设备类型
local version = "0.0.1"

local function task_main()
    local app = Application.new()

    -- 基础配置
    app:pre_setup({
        did=did,
        token=token,
        model=model,
        version=version
    })

    -- 注册日志模块
    local logger = Logger.new()
    logger.pre_setup()
    app:register_component(logger)

    app:setup()

    while true do
        app:loop()
        sys.wait(1)
    end
end

local function main()
    sys.init(0)
    sys.taskInit(task_main)
    sys.run()
end
main()