-- ===================================== --
-- ==         Saved Variables         == --
-- ===================================== --
TemplateAddOnDB = {}


-- ===================================== --
-- ==         Addon Variables         == --
-- ===================================== --
local frame = CreateFrame("Frame")
local handler = {}

-- ============================== --
-- ==    Event Handler Logic   == --
-- ============================== --

-- Build the OPtionstab when the Addon was loaded
function handler.ADDON_LOADED(name)
    if name == TemplateAddOnData["addonName"] then
        TemplateAddOnSettings:BuildOptionsMenu()
    end
end


-- ============================== --
-- ==     Core Addon Logic     == --
-- ============================== --

-- Register Events to the Frame
frame:RegisterEvent("ADDON_LOADED")

-- Execute all Event Handler
frame:SetScript("OnEvent", function(self, event, ...)
    local func = handler[event]
    if func then return func(...) end
end)