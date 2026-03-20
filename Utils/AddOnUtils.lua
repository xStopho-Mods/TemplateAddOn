local _, addon = ...

---Register a new Module.
---Modules get initialized in the Core.lua file inside the ADDON_LOADED event
---@param module table
function addon.RegisterModule(module)
    table.insert(addon.Modules, module)
end

---Register a needed Event.
---Event get registered to the AddOn Frame while the ADDON_LOADED event is triggered.
---@param event string
---@param func function
function addon.RegisterEvent(event, func)
    if addon.Events[event] == nil then
        addon.Events[event] = {}
    end

    table.insert(addon.Events[event], func)
end