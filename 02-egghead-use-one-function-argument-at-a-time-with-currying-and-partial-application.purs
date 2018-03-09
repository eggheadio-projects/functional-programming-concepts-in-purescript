module Main where

import Prelude (show, ($), (+), (=<<))
import Control.Monad.Eff.Console (log)
import TryPureScript (render, withConsole)

-- addMe (a -> (b -> (a + b)))
addMe :: Int -> Int -> Int
addMe = \a -> \b -> a + b

--             (b -> (a + b)))
addFive :: Int -> Int
addFive = addMe 5

main = render =<< withConsole do
  log $ show $ addFive 5