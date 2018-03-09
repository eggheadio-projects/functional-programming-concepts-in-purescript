 module Main where

import Prelude (($), (=<<), map, (<<<), (+), id, discard)
import Data.List ((:), List(..))
import Data.Maybe (Maybe(..))
import Control.Monad.Eff.Console (logShow)
import TryPureScript (render, withConsole)

-- data List a = Nil | Cons a (List a)
-- map :: forall a b. (a -> b) -> f a -> f b

myIntList :: List Int
myIntList = (Cons 1 ( Cons 2 ( Cons 3 Nil)))

map' :: forall a b. (a -> b) -> List a -> List b
map' _ Nil = Nil
map' f (x : xs) = f x : map' f xs

mapIdList :: List Int
mapIdList = map (id) myIntList

mapCompList :: List Int
mapCompList = map ((\a -> a + 2) <<< (\a -> a + 1)) myIntList

mapCompList' :: List Int
mapCompList' = (map (_ + 2) <<< map (_ + 1)) myIntList

main = render =<< withConsole do
  logShow $ mapCompList
  logShow $ mapCompList'