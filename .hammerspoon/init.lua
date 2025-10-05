-- iTerm2にフォーカスが当たったら英数キーを送信
local function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        if (appName == "iTerm2") then
            hs.eventtap.keyStroke({}, 'eisu')
        end
    end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
