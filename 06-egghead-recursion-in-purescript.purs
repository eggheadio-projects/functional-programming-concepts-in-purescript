 module Main where

import Prelude (show, ($), (=<<), (-), (*))
import Control.Monad.Eff.Console (log)
import TryPureScript (render, withConsole)

fact :: Int -> Int
fact 0 = 1
fact n = 6 * fact (n - 1)

-- fact 6 = 6 * 5 * 4 * 3 * 2 * 1  == 720
 
main = render =<< withConsole do
  log $ show $ fact 6