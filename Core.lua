local addonName, addon = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(_, event, ...)
    local name = ...
    if event == "ADDON_LOADED" and name == addonName then
        -- Initialize addon Tables
        addon.Events = {}
        addon.Modules = {}

        -- Register Module Events
        if addon.Events ~= nil then
            for eName, _ in ipairs(addon.Events) do
                f:RegisterEvent(eName)
            end
        end

        -- Initialize Modules
        if addon.Modules ~= nil then
            for _, module in pairs(addon.Modules) do
                if module.Init ~= nil then
                    module.Init()
                end
            end
        end

        f:UnregisterEvent("ADDON_LOADED")
    end

    -- Trigger Events registered by Modules
    if addon.Events[event] ~= nil then
        for _, func in ipairs(addon.Events[event]) do
            if func then func(...) end
        end
    end
end)