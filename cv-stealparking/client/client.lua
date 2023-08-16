
local QBCore = exports["qb-core"]:GetCoreObject()

---- locals ----

local rob = false

local objecs = {
    "prop_parknmeter_01",
    "prop_parknmeter_02"
}

---- functions ----

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end


---- Events ----

RegisterNetEvent("cv-stealparking:client:steal", function()
    local hasItem = QBCore.Functions.HasItem('lockpick')
    local random = math.random(Config.MinMoney, Config.MaxMoney)
    
    if rob then
        QBCore.Functions.Notify("Hold up buddy", "error")
        Citizen.Wait(Config.cooldown)
        rob = false
    else
    if hasItem then
        loadAnimDict('veh@break_in@0h@p_m_one@')
        TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
        exports['ps-ui']:Circle(function(success)
            if success then
                TriggerServerEvent("cv-stealparking:server:getmoney", random)
                rob = true
            else
                QBCore.Functions.Notify("You failed", "error")
                ClearPedTasksImmediately(PlayerPedId())
            end
        end, 4, 20) -- NumberOfCircles, MS
    else
        QBCore.Functions.Notify("You don't have a lockpick", "error")
    end
 end
end)

---- Target ----

Citizen.CreateThread(function()
    while true do
exports['qb-target']:AddTargetModel(objecs, {
    options = {
        {
            event = "cv-stealparking:client:steal",
            icon = "fas fa-hands",
            label = "Steal Money",
        },
    },
    distance = 2.5,
})
    Citizen.Wait(50)
    end
end)

