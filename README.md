# cv-stealparking
A script to steal some money in the parking meter

# In Game #

![giphy](https://github.com/CoreVersion/cv-stealparking/assets/111662813/55f57ac3-d847-415f-a434-9e0539818969)

![image](https://github.com/CoreVersion/cv-stealparking/assets/111662813/0cd7060e-e930-44e9-a01d-441576997454)

# Requirement #

qb-core - https://github.com/qbcore-framework/qb-core

ps-ui - https://github.com/Project-Sloth/ps-ui

ps-dispatch - https://github.com/Project-Sloth/ps-dispatch

qb-target - https://github.com/qbcore-framework/qb-target

# Install #

ps-dispatch > client > cl_extraalerts.lua

```lua
---------------------------
---- cv-stealparking -------
---------------------------

local function StealParking()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "stealparking", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-36",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = 'Parking meter geting robbed', -- message
        job = {"LEO", "police"} -- type or jobs that will get the alerts
    })
end exports('StealParking', StealParking)
```

ps-dispatch > server > sv_dispatchcodes.lua

```lua
    -- CoreVesrion
    ["stealparking"] =  {displayCode = '10-36', description = "Parking meter geting robbed", radius = 0, recipientList = {'LEO', 'police'}, blipSprite = 358, blipColour = 60, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false", blipflash = "false"},
```

# Discord: # 
https://discord.gg/VmPWhNWv8k
