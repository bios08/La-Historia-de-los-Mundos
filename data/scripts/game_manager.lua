-- Script that creates a game ready to be played.

-- Usage:
-- local game_manager = require("scripts/game_manager")
-- local game = game_manager:create("savegame_file_name")
-- game:start()

require("scripts/multi_events")
local initial_game = require("scripts/initial_game")

local game_manager = {}



-- Starts the game from the given savegame file,
-- initializing it if necessary.
function game_manager:create(file_name, overwrite_game)
  if overwrite_game then sol.game.delete(file_name) end
  local exists = sol.game.exists(file_name)
  local game = sol.game.load(file_name)
  if not exists then -- Initialize a new savegame.
    initial_game:initialize_new_savegame(game)
  end




--Pause Menu
      function game:on_paused()

        require("scripts/menus/pause_infra")
        pause_infra:update_game(game)
        sol.menu.start(game, pause_infra)

      --
        --save dialog
        game:start_dialog("_game.pause", function(answer)
          if answer == 1 then
            game:set_paused(false)
          elseif answer == 2 then
            game:save()
            sol.audio.play_sound("elixer_upgrade")
            game:set_paused(false)
          elseif answer == 3 then
            sol.main.exit()
          end
        end)


      end --end of on:paused function


      function game:on_unpaused()
        require("scripts/menus/pause_infra")
        sol.menu.stop(pause_infra)
      end  





  return game
end







   








return game_manager
