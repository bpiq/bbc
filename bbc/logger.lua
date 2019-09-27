-- 日志组件
-- yueqiumao (u2nn@qq.com)

Logger = class("Logger", Component)

require "log"
LOG_LEVEL = log.LOGLEVEL_TRACE

logger = nil

function Logger:ctor()
    self.super.ctor(self)
    logger = self
end

function Logger:get_setup_priority()
    return SETUP_PRIORITY_HARDWARE-1
end

function Logger:pre_setup()
    
end

function Logger:begin()
    logger.info("日志组件启动")
end

function Logger:debug(...)
    log.debug(...)
end

function Logger:info(...)
    log.info(...)
end

function Logger:warn(...)
    log.warn(...)
end

function Logger:error(...)
    log.error(...)
end

function Logger:fatal(...)
    log.fatal(...)
end