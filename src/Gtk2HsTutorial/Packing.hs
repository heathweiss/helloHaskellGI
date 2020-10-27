{-# LANGUAGE OverloadedStrings, OverloadedLabels #-}
{- |
Follows section 3 Packing of the Gtk2Hs Tutorial: https://archives.haskell.org/code.haskell.org/gtk2hs/docs/tutorial/Tutorial_Port/chap3-1.xhtml
Is quite different as the tutorial is old.
-}
module Gtk2HsTutorial.Packing() where

import qualified GI.Gtk as Gtk
import Data.Word
import Data.Int
import Data.Text
import GI.Gtk (AttrOp((:=)))
--or could have used: import Data.GI.Base

--https://archives.haskell.org/code.haskell.org/gtk2hs/docs/tutorial/Tutorial_Port/chap2.xhtml
gettingStarted :: IO ()
gettingStarted = do
  Gtk.init Nothing
  win <- Gtk.new Gtk.Window [ #title := "Getting Started" ]
  Gtk.on win #destroy Gtk.mainQuit

  myButton <-  Gtk.buttonNewWithLabel "Virgin button"
  --which is short for:
  --myButton <- Gtk.new Gtk.Button []
  --Gtk.set myButton [#label := "Virgin button"]
  Gtk.on myButton #clicked (Gtk.set myButton [#label := "Now I have been used"])
  #add win myButton


  #resize win 200 200
  #showAll win
  Gtk.main

--https://archives.haskell.org/code.haskell.org/gtk2hs/docs/tutorial/Tutorial_Port/chap3-1.xhtml
packingWidgets :: IO ()
packingWidgets = do
  Gtk.init Nothing
  win <- Gtk.new Gtk.Window [ #title := "Packing Widgets" ]
  Gtk.on win #destroy Gtk.mainQuit
  

  --box used to hold the buttons.
  --box <- Gtk.new Gtk.Box [#orientation := Gtk.OrientationVertical]
  --same as:
  vbox <- Gtk.new Gtk.VBox []
  #add win vbox

  label1 <- Gtk.new Gtk.Label [#label := "Label 1", #xalign := 0]
  #packStart vbox label1 False False 10

  box1 <- makeBox 5 1
  #packStart vbox box1 False False 10

  box2 <- makeBox 5 10
  #packStart vbox box2 False False 10

  #resize win 200 200
  #showAll win
  Gtk.main

type Padding = Word32
type Spacing = Int32
makeBox :: Spacing -> Padding -> IO (Gtk.HBox)
makeBox spacing padding = do
  box <- Gtk.new Gtk.HBox []
  --Gtk.boxSetHomogeneous box True
  Gtk.setBoxSpacing box spacing
  button1 <- Gtk.buttonNewWithLabel "boxPackStart"
  button2 <- Gtk.buttonNewWithLabel "box"
  button3 <- Gtk.buttonNewWithLabel "button"
  button4 <- Gtk.buttonNewWithLabel "PackRepel"
  button5 <- Gtk.buttonNewWithLabel $ pack $ show padding
  Gtk.boxPackStart box button1 True False padding
  Gtk.boxPackStart box button2 True False padding
  Gtk.boxPackStart box button3 True False padding
  Gtk.boxPackStart box button4 True False padding
  Gtk.boxPackStart box button5 True False padding
  return box
