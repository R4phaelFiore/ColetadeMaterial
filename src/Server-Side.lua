local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface(GetCurrentResourceName(), src)
vRPclient  = Tunnel.getInterface("vRP")

function src.ChecarItem()
    local source = source
    local user_id = vRP.getUserId(source)

    vRPclient._playAnim(source, false, {{"amb@medic@standing@tendtodead@idle_a", 'idle_a'}}, true)
    SetTimeout(2000, function()
        vRPclient._stopAnim(source, false)

        -- Chance de 25% (1 em 4) para receber todos os itens
        if math.random(1, 4) == 1 then
            for _, v in ipairs(Config.modelo.items) do
                print("\n^4PLAYER:",source,"^1RECEBEU TODOS OS ITEMS:^2",v.name,"^0")
                local checarAleatorio = math.random(Config.modelo.Payment.Min, Config.modelo.Payment.Max)
                vRP.giveInventoryItem(user_id, v.name, checarAleatorio)
            end
        else
            local randomItem = math.random(1, #Config.modelo.items)
            local item = Config.modelo.items[randomItem]
            local checarAleatorio = math.random(Config.modelo.Payment.Min, Config.modelo.Payment.Max)
            vRP.giveInventoryItem(user_id, item.name, checarAleatorio)
        end
    end)
end


print('^2SCRIPT TOTALMENTE FREE ^1BY R4PHAEL FIORE^0')