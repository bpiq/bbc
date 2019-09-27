-- 状态LED组件
-- yueqiumao (u2nn@qq.com)

StatusLed = class("StatusLed", Component)

require "pins"

function StatusLed:get_setup_priority()
    return SETUP_PRIORITY_HARDWARE
end

function StatusLed:get_loop_priority()
    return SETUP_PRIORITY_IO-1
end

function StatusLed:pre_setup()
    self.gpio_led = pins.setup(pio.P0_28, 0)
end

function StatusLed:setup()
    logger.info("状态LED组件启动")
end

function StatusLed:loop()
    if app:get_app_state() == STATUS_LED_ERROR then
        self.gpio_led(millis() % 250 < 150 and 1 or 0)
    elseif app:get_app_state() == STATUS_LED_WARNING then
        self.gpio_led(millis() % 1500 < 250 and 1 or 0)
    else
        self.gpio_led(0)
    end
end
