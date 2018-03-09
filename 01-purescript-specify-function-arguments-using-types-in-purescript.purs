module Main where

import Prelude (show, ($), (+), (=<<))
import Control.Monad.Eff.Console (log)
import TryPureScript (render, withConsole)

addMe :: Int -> Int -> Int
addMe a b = a + b

main = render =<< withConsole do
  log $ show $ addMe 5 5