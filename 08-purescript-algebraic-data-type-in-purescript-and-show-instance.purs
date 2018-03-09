 module Main where

import Prelude (class Show, show, ($), (=<<), (+), (<>))
import Control.Monad.Eff.Console (logShow)
import TryPureScript (render, withConsole)

data Vehicle
  = Car Wheels
  | Motorcycle Wheels
  | Skateboard Wheels
  | Bicycle Wheels
  
data Wheels = Wheels Int

instance showWheels' :: Show Wheels where
  show = showWheels
  
instance showVehicle' :: Show Vehicle where
  show = showVehicle
  
myVehicle :: Vehicle
myVehicle = Car (Wheels 6)

showVehicle :: Vehicle -> String
showVehicle (Car a) = "Vehicle: Car, " <> show a
showVehicle (Motorcycle a) = "Vehicle: Motorcycle, " <> show a
showVehicle (Skateboard a) = "Vehicle: Skateboard, " <> show a
showVehicle (Bicycle a) = "Vehicle: Bicycle, " <> show a

showWheels :: Wheels -> String
showWheels (Wheels a) = "Wheels: " <> show a

main = render =<< withConsole do
  logShow $ myVehicle