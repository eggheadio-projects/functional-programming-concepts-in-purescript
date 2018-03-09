 module Main where

import Prelude (show, ($), (=<<), (+))
import Data.Array (null)
import Data.Array.Partial (tail)
import Partial.Unsafe (unsafePartial)
import Control.Monad.Eff.Console (log)
import TryPureScript (render, withConsole)

length :: forall a. Array a -> Int
length [] = 0
length arr = 1 + length
  (unsafePartial tail arr)


main = render =<< withConsole do
  log $ show $ length [1, 2, 3, 4]