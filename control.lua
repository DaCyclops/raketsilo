
 -- Start OnLoad/OnInit/OnConfig events
script.on_configuration_changed( function(data)
  if data.mod_changes ~= nil and data.mod_changes["raketsilo"] ~= nil and data.mod_changes["raketsilo"].old_version == nil then
   -- Mod added 
	
    for _,force in pairs(game.forces) do
      force.reset_recipes()
      force.reset_technologies()
      local techs=force.technologies
      local recipes=force.recipes
      --Tech Addition
      if techs["rocket-silo"].researched then
        recipes["raketsilo_parts"].enabled=true
        recipes["raketsilo_assemble"].enabled=true
      end
    end     
  end 

  if data.mod_changes ~= nil and data.mod_changes["raketsilo"] ~= nil and data.mod_changes["raketsilo"].old_version ~= nil then
   -- Mod updated or removed
   
    for _,force in pairs(game.forces) do
      force.reset_recipes()
      force.reset_technologies()
      local techs=force.technologies
      local recipes=force.recipes
      --Tech Addition
      if techs["rocket-silo"].researched then
        recipes["raketsilo_parts"].enabled=true
        recipes["raketsilo_assemble"].enabled=true
      end
    end   
  end
end)


script.on_init(function()
  --Nothing to Do Now 
 
end)   
  
script.on_load(function()
  --Nothing to Do Now  
end)
-- End OnLoad/OnInit/OnConfig events
