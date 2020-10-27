{-# LANGUAGE OverloadedStrings, OverloadedLabels #-}
module Main where

import Lib

--main :: IO ()
--main = someFunc
--main = someFunc
import qualified GI.Gtk as Gtk
import Data.GI.Base

main :: IO ()
main = do
  Gtk.init Nothing

  win <- new Gtk.Window [ #title := "Return On Assets" ]
  
  on win #destroy Gtk.mainQuit

  --box is a container used to hold children, such as buttons and labels.
  box <- new Gtk.Box [#orientation := Gtk.OrientationVertical]
  #add win box

  msg <- new Gtk.Label [#label := "Hello from the Box"]
  -- #add box msg
  -- use alt packStart method which allows for more info. Not sure about the parameters.
  #packStart box msg True False 10

  --add an input label with a max length of the input field
  entryLabel <- new Gtk.Entry [#maxLength := 10]
  -- #add box entryLabel
  #packStart box entryLabel False True 10
  -- output the maxlength info to stdout
  initialMaxLength <- get entryLabel #maxLength
  putStrLn $ "initial entryLabel max length: " ++ show initialMaxLength

  
  --add a button
  button <- new Gtk.Button  [ #label := "Click me" ]
  
  on button #clicked (set button [ #sensitive := False,
                                   #label := "Thanks for clicking me"
                                 ])
  on button #clicked (set entryLabel [ #sensitive := False,
                                       #placeholderText :=  "You did not add a value"
                                 ])
  #packStart box button False False 10
  -- /add a button

  
  
  
  #resize win 640 480
  

  #showAll win

  Gtk.main


