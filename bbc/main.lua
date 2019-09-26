-- 主入口
-- yueqiumao (u2nn@qq.com)

PROJECT = "BBC"
VERSION = "1.0.0"
PRODUCT_KEY = "v32xEAKsGTIEQxtqgwCldp5aPlcnPs3K"

require "sys"

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

function start()
    local app = Application.new()

    app:pre_setup({
        did=did,
        token=token,
        model=model
    })

    local logger = Logger.new()
    logger.pre_setup()
    app:register_component(logger)

    app:setup()

    while true do
        app:loop()
    end
end

function _main()
    sys.init(0)

    start()

    sys.run()
end
_main()