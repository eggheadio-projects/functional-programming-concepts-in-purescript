 module Main where

import Prelude

import Data.List(List(..), (:), concat, concatMap)

import Control.Monad.Eff.Console (logShow)
import TryPureScript (render, withConsole)

myIntList :: List Int
myIntList = (Cons 1 ( Cons 2 ( Cons 3 ( Cons 4 Nil))))

foldl' :: forall a b. (b -> a -> b) -> b -> List a -> b
foldl' f acc l = case l of
  Nil -> acc
  (x : xs) -> foldl' f (f acc x) xs
  
map' :: forall a b. (a -> b) -> List a -> List b
map' f xs = foldl' (\acc x -> acc <> Cons (f x) Nil) Nil xs

filter' :: forall a b. (a -> Boolean) -> List a -> List a
filter' f xs = 
     foldl'
     (\acc x ->
       acc <> if f x then Cons x Nil else Nil)
       Nil xs
    
reverse' :: forall a b. List a -> List a
reverse' xs = foldl' (\acc x -> Cons x acc) Nil xs
    
main = render =<< withConsole do
  logShow $ foldl' (+) 0 myIntList
  logShow $ map' (_ + 1) myIntList
  logShow $ filter' (_ > 2) myIntList
  logShow $ reverse' myIntList