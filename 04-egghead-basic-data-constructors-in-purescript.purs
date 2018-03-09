module Main where

import Prelude (show, ($), (=<<), (<>))
import Control.Monad.Eff.Console (log)
import TryPureScript (render, withConsole)

data Foo = Foo1 | Bar String

runFoo :: Foo -> String
runFoo Foo1 = "Damn right it's Foo"
runFoo (Bar s) = "Yeah it's Bar and " <> s

main = render =<< withConsole do
  log $ show $ runFoo (Bar "his buddy")