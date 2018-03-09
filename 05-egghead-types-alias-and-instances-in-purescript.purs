 module Main where

import Prelude (class Show, show, ($), (=<<), (<>))
import Control.Monad.Eff.Console (log)
import TryPureScript (render, withConsole)

type PersonRec = { name :: String
                 , age  :: Int
                 }

data Person = PersonA PersonRec

instance showPerson :: Show Person where
  show (PersonA { name, age}) =
    "PersonA { name: " <> show name
    <> ", age: " <> show age <> "})"

whoAmI :: String -> Int -> Person
whoAmI name age = PersonA { name, age }

main = render =<< withConsole do
  log $ show $ whoAmI "You" 300