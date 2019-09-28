-- 主入口
-- yueqiumao (u2nn@qq.com)

PROJECT = "BBC"
VERSION = "0.0.1"
PRODUCT_KEY = "v32xEAKsGTIEQxtqgwCldp5aPlcnPs3K"

require "log"
require "sys"
require "net"
require "sim"
require "misc"
require "sms"
require "wdt"
require "link"
require "socket"
require "httpv2"

require "util"
require "class"
require "component"
require "logger"
require "event"
require "network"
require "application"
require "status_led"
require "gprs"
require "watchcat"

local TAG = "main"

local did = 10001 -- 设备编号
local token = "hellohelloballcat" -- 设备令牌
local model = "com.ball.car" -- 设备类型

local function task_main()
    -- 主app初始化
    local app = Application.new()
    app:pre_setup({
        did=did,
        token=token,
        model=model,
        version=VERSION
    })

    -- 注册日志组件
    local logger = Logger.new()
    logger:pre_setup()
    app:register_component(logger)

    -- 注册led组件
    local status_led = StatusLed.new()
    status_led:pre_setup()
    app:register_component(status_led)

    -- 注册看门猫组件
    local watchcat = Watchcat.new()
    app:register_component(watchcat)

    -- 注册gprs组件
    local gprs = Gprs.new()
    app:register_component(gprs)

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