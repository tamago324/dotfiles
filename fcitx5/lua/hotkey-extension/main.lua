local fcitx = require("fcitx")

fcitx.watchEvent(fcitx.EventType.KeyEvent, "handler")

function handler(sym, state, release)
    if ((sym == 65307 and state == 0) or (sym == 91 and state == 4)) and
        not release
    then
        -- 日本語配列
        -- Thanks https://github.com/namachan10777/dotman/blob/a39a0c36dc170a544bece65b15fa922d449d01ae/config_example/pkgs/fcitx5/lua/hotkey-extension/main.lua#L6
        fcitx.setCurrentInputMethod("keyboard-jp")
    end
    return false
end
