-- This script initializes game values for a new savegame file.
-- You should modify the initialize_new_savegame() function below
-- to set values like the initial life and equipment
-- as well as the starting location.
--
-- Usage:
-- local initial_game = require("scripts/initial_game")
-- initial_game:initialize_new_savegame(game)

local initial_game = {}

-- Sets initial values to a new savegame file.
function initial_game:initialize_new_savegame(game)

  -- You can modify this function to set the initial life and equipment
  -- and the starting location.
  -- MAPA INICIAL A MOSTRAR, DESPUES DEL TITLE Y PRESIONAR START
     game:set_starting_location("0_intro", nil) --
	--ame:set_starting_location("Saphire/Dream1", nil)
  --game:set_starting_location("first_map", nil)  -- Starting location.
  --game:set_starting_location("blue_port/sapphire_south", nil)  -- Starting location.

  game:set_max_life(12)
  game:set_life(game:get_max_life())
  game:set_max_money(100)
  game:set_ability("lift", 1)
  game:set_ability("sword", 1)

  -----------------------------------------------------------------------------------------------
  -- Para el juego: Historia de los mundos:  -------------------------------------------
  -- Por Marlon Llanos
  

  
  

  -- Variables globales para logicas del juego
  
  -- ZONA: Puerto azul
  game:set_value("puerto_azul_carta1","b0")
  game:set_value("puerto_azul_carlos_se_fue","b0")

  -- ZONA: Saphire south
  game:set_value("save_sapphire_south_anie1_listo", "false")
  game:set_value("sap_s_anie1", 0)

end

return initial_game
