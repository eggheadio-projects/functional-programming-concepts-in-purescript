module Main where

import Prelude (show, ($), (+), (=<<))
import Control.Monad.Eff.Console (log)
import TryPureScript (render, withConsole)

isEmpty :: forall a. Array a -> Boolean
isEmpty [] = true
isEmpty _ = false

main = render =<< withConsole do
  log $ show $ isEmpty [1, 2]
  --log $ show $ isEmpty []