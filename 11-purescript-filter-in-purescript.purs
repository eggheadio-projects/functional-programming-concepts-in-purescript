 module Main where

import Prelude (otherwise, ($), (<=), (=<<))
import Data.List ((:), List(..), reverse, filter)

import Control.Monad.Eff.Console (logShow)
import TryPureScript (render, withConsole)

-- data List a = Nil | Cons a (List a)
-- map :: forall a b. (a -> b) -> f a -> f b

myIntList :: List Int
myIntList = (Cons 1 ( Cons 2 ( Cons 3 Nil)))

mySmallIntList :: List Int
mySmallIntList = (Cons 1 ( Cons 2 Nil))

filter' :: forall a. (a -> Boolean) -> List a -> List a
filter' p l = go Nil l
  -- go (Nil) (1 : 2 : Nil)
  where
  go acc Nil = reverse acc
  -- go (Nil : 1) Nil = reverse (Nil :1) = (1 :Nil)
  go acc (x : xs)
  -- x = (2), xs = (Nil)
    | p x = go (x : acc) xs
    -- (2 < 2) = go (1 : Nil) (2 : Nil)
    | otherwise = go acc xs
    -- go (Nil : 1) (Nil)

main = render =<< withConsole do
  logShow $ filter' (_ <= 2) myIntList