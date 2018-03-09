module Main where

import Prelude

import Data.List(List(..), (:))


import Control.Monad.Eff.Console (logShow)
import TryPureScript (render, withConsole)

myListList :: List (List Int)
myListList = 
  (Cons
      (Cons 1 (Cons 2 Nil))
    (Cons
      (Cons 3 (Cons 4 Nil))
  Nil))
  
concatLists :: forall a. List (List a) -> List a
concatLists Nil = Nil
concatLists (x : xs) = x <> concatLists xs

concatMapLists :: forall a b. (List a -> List b) -> List (List a) -> List b
concatMapLists f Nil = Nil
concatMapLists f (x : xs) = (f x) <> (concatMapLists f xs)

main = render =<< withConsole do
  logShow $ myListList
  logShow $ concatMapLists (map (_ + 1)) myListList
  
  