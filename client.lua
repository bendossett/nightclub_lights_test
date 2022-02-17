RegisterCommand('test', function(source, args, raw)
  local hash = GetHashKey('ba_rig_dj_02_lights_04_b')
  RequestModel(hash)
  
  while not HasModelLoaded(hash) do
    Wait(1)
  end

  RequestAnimDict('ba_prop_battle_lights_05')
  while not HasAnimDictLoaded('ba_prop_battle_lights_05') do
    Wait(1)
  end

  local entity = CreateObjectNoOffset(hash, GetEntityCoords(PlayerPedId()), true, false, false)
  if DoesEntityExist(entity) then
    print('entity created')
    SetEntityHeading(entity, GetEntityHeading(PlayerPedId()) + 90.0)
    PlayEntityAnim(entity, 'ba_rig_dj_02_lights_04_c', 'ba_prop_battle_lights_05', 1.0, true, true, false, 1.0, 0)
  end
  SetModelAsNoLongerNeeded(hash)
end, false)
