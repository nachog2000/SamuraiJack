module Lib where
import Text.Show.Functions

laVerdad = True

data Elemento = UnElemento { 
    tipo :: String, 
    ataque :: (Personaje-> Personaje),
    defensa :: (Personaje-> Personaje) 
 }deriving (Show)

data Personaje = UnPersonaje { 
    nombre :: String,
    salud :: Float,
    elementos :: [Elemento],
    anioPresente :: Int 
 }deriving (Show)


personajePrueba = UnPersonaje {
    nombre = "Ignacio",
    salud = 90,
    elementos = [],
    anioPresente = 2020
}

-- Punto 1)

mandarAlAnio :: Int -> Personaje -> Personaje
mandarAlAnio anioAMandar personaje = personaje {anioPresente = anioAMandar}

meditar :: Personaje -> Personaje
meditar personaje = personaje {salud = salud personaje + modificarSalud (/2) personaje}

causarDanio :: Float -> Personaje -> Personaje
causarDanio cantidad personaje = personaje {salud = max 0 (modificarSalud (flip (-) cantidad) personaje) }

modificarSalud :: (Float -> Float) -> Personaje -> Float
modificarSalud f personaje = (f.salud) personaje


