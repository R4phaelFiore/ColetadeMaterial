local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
src = Tunnel.getInterface(GetCurrentResourceName())

CreateThread(function()
    while true do
        local Ped = PlayerPedId()
        local Entity = GetEntityCoords(Ped)

        for _, modelo in pairs(Config.modelo.modeloObjetos) do
            if modelo.hash then
                local objeto = GetClosestObjectOfType(Entity, 30.0, modelo.hash, false, false, false)

                if objeto and objeto ~= 0 then
                    local objetoCoords = GetEntityCoords(objeto)
                    local Distance = #(Entity - objetoCoords)
                    local x, y, z = table.unpack(objetoCoords)


                    if Distance <= 5 then
                        DrawMarker(23, x,y,z, 0,0,0, 0,0,0, 0.8,0.8,0.8, 255,0,0,155, false,false,2,false)
                        if Distance <= 5 then
                            if IsControlJustPressed(0, 38) then
                                src.ChecarItem()
                                Config.modelo.modeloObjetos[_] = nil
                                SetTimeout(1000, function()
                                    Config.modelo.modeloObjetos[_] = modelo
                                end)
                            end
                        end
                    end
                end
            end
        end

        Citizen.Wait(5)
    end
end)