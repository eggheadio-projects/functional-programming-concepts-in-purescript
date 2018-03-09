 module Main where

import Prelude (($), (=<<))
import Data.List ((:), List(..))
import Data.Maybe (Maybe(..))
import Control.Monad.Eff.Console (logShow)
import TryPureScript (render, withConsole)

-- data List a = Nil | Cons a (List a)

myIntList :: List Int
myIntList = (Cons 1 ( Cons 2 ( Cons 3 Nil)))

main = render =<< withConsole do
  logShow $ myIntList