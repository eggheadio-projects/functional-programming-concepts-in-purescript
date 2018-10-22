# How to setup Purescript locally

## Setup

First, make sure you have Node installed. 

Next, we’ll use the node package manager (npm) to install PureScript.

  > npm install -g purescript

And to go along with PureScript, we’ll need the Pulp build tool and the Bower package manager.

  > npm install -g pulp bower

Setup a project directory and open it in your terminal. 
Run the following three commands. 

  > pulp init
  > pulp build
  > pulp run

if its working it should print "Hello sailor!" in the console.

Now we need to install some packages he uses for this course:

  > bower install purescript-arrays
  > bower install purescript-lists

Now compile it with pulp build:
 
  > pulp build


Now you should be able to go `src/Main.purs` and start coding.

## Code Changes

In the course Vincent is using the try.purescript.org online editor. The editor is a bit out of date with the latest version of purescript and it's packages. So we have to make the following changes to get the code examples to run on our machines. 

So lets take some code from lesson one, and put it into `Main.purs`

#### src/Main.purs
```purescript
 module Main where

import Prelude (show, ($), (+), (=<<))
import Control.Monad.Eff.Console (log)
import TryPureScript (render, withConsole)

addMe :: Int -> Int -> Int
addMe a b = a + b

main = render =<< withConsole do
    log $ show $ addMe 5 5
```

This code will work on try.purescript but it won't work on our machine. Let's make some changes. 

We need to remove `import TryPureScript (render, withConsole)`. The `TryPureScript` package is used to render to the try.purescript console specifically. 

`import Control.Monad.Eff.Console (log)` also needs to be removed and replaced with `import Effect.Console (log)`. This change was made as of purescript-console version 4.0.0. 

Then we need to change `main = render =<< withConsole do` to just `main = do`.

Your lesson one code should now look like this. 

#### src/Main.purs
```purescript
 module Main where

import Prelude (show, ($), (+), (=<<))
import Effect.Console (log)

addMe :: Int -> Int -> Int
addMe a b = a + b

main = do
    log $ show $ addMe 5 5
```

Now save the file, and in your terminal type:

  > pulp run

If `10!` is outputted purescript is ready to be used locally!

## Changes to Lesson 10

In lesson 10, all instances of `id` need to be changed to `identity`. This change was made as of [purescript-prelude version 4.0.0](https://github.com/purescript/purescript-prelude/releases/tag/v4.0.0). 

