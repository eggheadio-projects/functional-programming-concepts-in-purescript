module Main where

 import Prelude
 
 import Data.List(List(..), (:))
 
 import Control.Monad.Eff.Console (logShow)
 import TryPureScript (render, withConsole)


 myIntList :: List Int
 myIntList = (Cons 1 ( Cons 2 ( Cons 3 ( Cons 4 Nil))))

 foldl' :: forall a b. (b -> a -> b) -> b -> List a -> b
 foldl' f acc l = case l of
   -- acc = 10
   Nil -> acc
   (x : xs) -> foldl' f (f acc x) xs
   -- (4) (Nil) = foldl' (+) (10) (Nil)
  
   -- 1 + 2 + 3 + 4 
  
 main = render =<< withConsole do
   logShow $ foldl' (+) 0 myIntList