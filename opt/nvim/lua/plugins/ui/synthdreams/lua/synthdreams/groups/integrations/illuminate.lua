-- Este archivo define los colores de resaltado para el plugin 'illuminate.nvim',
-- que marca todas las ocurrencias de la palabra bajo el cursor. 
-- Se distinguen tres tipos: texto normal, lectura y escritura, pero aquí se usan
-- todos con el mismo fondo para mantener consistencia visual.

local p = require("synthdreams.palette")
return {
    IlluminatedWordText = { bg = p.gray5 },
    IlluminatedWordRead = { bg = p.gray5 },
    IlluminatedWordWrite = { bg = p.gray5 },
}

