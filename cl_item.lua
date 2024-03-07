local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = exports["es_extended"]:getSharedObject()
local PlayerData = {}
local ped = PlayerPedId()
local mainMenu = false
local animation = true
local animationtime = 1500

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

local coffeeMachine = 690372739
local snackMachine = -654402915
local sodaMachines = {992069095, 1114264700, -1103205386, -756557762}
local waterMachine = {-742198632, 1099892058, -1691644768, 339851415, 2059009409}
local condomMachine = 684389648
local smokeMachine = 73774428
--local foodvanMachines = {-272361894, 1257426102}
--local kioskMachine = -2009466172
--local fridgeMachine = -1317235795
local medicMachine = -509973344

-- Définir les options pour chaque type de machine
exports['qtarget']:AddTargetModel(sodaMachines, {
    options = {
        {
            event = "curse-vending1",
            icon = "fas fa-hands",
            label = "Acheter une canette de eCola",
            itemName = 'cola',
            price = 15,
        },
        {
            event = "curse-vending2",
            icon = "fas fa-hands",
            label = "Acheter une canette de soda orange",
            itemName = 'sorange',
            price = 15,
        }
    },
    distance = 2.5,
})

exports['qtarget']:AddTargetModel(snackMachine, {
    options = {
        {
            event = "curse-vending3",
            icon = "fas fa-hands",
            label = "Acheter une barre de chocolat",
            itemName = 'chocolate',
            price = 15,
        }
    },
    distance = 2.5,
})

exports['qtarget']:AddTargetModel(coffeeMachine, {
    options = {
        {
            event = "curse-vending4",
            icon = "fas fa-hands",
            label = "Acheter un café",
            itemName = 'coffee',
            price = 15,
        }
    },
    distance = 2.5,
})

exports['qtarget']:AddTargetModel(waterMachine, {
    options = {
        {
            event = "curse-vending5",
            icon = "fas fa-hands",
            label = "Acheter une bouteille d'eau",
            itemName = 'water',
            price = 15,
        }
    },
    distance = 2.5,
})

exports['qtarget']:AddTargetModel(condomMachine, {
    options = {
        {
            event = "curse-vending6",
            icon = "fas fa-hands",
            label = "Acheter une capote",
            itemName = 'condom',
            price = 15,
        }
    },
    distance = 2.5,
})

exports['qtarget']:AddTargetModel(smokeMachine, {
    options = {
        {
            event = "curse-vending7",
            icon = "fas fa-hands",
            label = "Acheter un Ticket GoldenGratGrat",
            itemName = 'scratch_ticket',
            price = 15,
        }
    },
    distance = 2.5,
})

exports['qtarget']:AddTargetModel(medicMachine, {
    options = {
        {
            event = "curse-vending8",
            icon = "fas fa-hands",
            label = "Récupérer des bandages",
            itemName = 'bandage',
            price = 0,
        }
    },
    distance = 2.5,
})

exports['qtarget']:AddTargetModel(smokeMachine, {
    options = {
        {
            event = "curse-vending9",
            icon = "fas fa-hands",
            label = "Acheter une cigarette",
            itemName = 'cigarette',
            price = 5,
        }
    },
    distance = 2.5,
})

RegisterNetEvent('curse-vending1')
AddEventHandler('curse-vending1', function()
    TriggerEvent('curse-vending', 'cola', "une canette de eCola", 15)
end)

RegisterNetEvent('curse-vending3')
AddEventHandler('curse-vending3', function()
    TriggerEvent('curse-vending', 'chocolate', "une barre de chocolat", 15)
end)

RegisterNetEvent('curse-vending2')
AddEventHandler('curse-vending2', function()
    TriggerEvent('curse-vending', 'sorange', "une canette de soda orange", 15)
end)

RegisterNetEvent('curse-vending4')
AddEventHandler('curse-vending4', function()
    TriggerEvent('curse-vending', 'coffee', "un café", 15)
end)

RegisterNetEvent('curse-vending5')
AddEventHandler('curse-vending5', function()
    TriggerEvent('curse-vending', 'water', "une bouteille d'eau", 15)
end)

RegisterNetEvent('curse-vending6')
AddEventHandler('curse-vending6', function()
    TriggerEvent('curse-vending', 'condom', "une capote", 15)
end)

RegisterNetEvent('curse-vending7')
AddEventHandler('curse-vending7', function()
    TriggerEvent('curse-vending', 'scratch_ticket', "un Ticket GoldenGratGrat", 5)
end)

RegisterNetEvent('curse-vending8')
AddEventHandler('curse-vending8', function()
    TriggerEvent('curse-vending', 'bandage', "un bandage", 0)
end)

RegisterNetEvent('curse-vending9')
AddEventHandler('curse-vending9', function()
    TriggerEvent('curse-vending', 'cigarette', "une cigarette", 5)
end)

RegisterNetEvent('curse-vending')
AddEventHandler('curse-vending', function(itemName, label, price)
    local ped = PlayerPedId()
    local machineCoords = GetEntityCoords(ped)
    local closestMachine = ESX.Game.GetClosestObject(machineCoords, machines)

    if closestMachine then
        TriggerEvent('nh-context:sendMenu', {
            {
                id = 1,
                header = "Acheter "..label,
                txt = "$"..price,
                params = {
                    event = "curse:BuyItem",
                    args = {
                        itemName = itemName,
                        price = price,
                    }
                }
            }
        })
    end
end)

RegisterNetEvent('curse:BuyItem')
AddEventHandler('curse:BuyItem', function(data)
    local itemName = data.itemName
    local price = data.price
    local ped = PlayerPedId()
    TriggerServerEvent('curse:SetBuy', itemName, price)
end)

RegisterNetEvent('animation')
AddEventHandler('animation', function()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_BUM_BIN", 0, true)
    Citizen.Wait(3000) -- Attendez la fin de l'animation
    ClearPedTasks(ped)
end)