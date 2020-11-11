{-# LANGUAGE OverloadedStrings, OverloadedLabels #-}
module Glade.HelloGlade(mainWindow) where

import GI.Gtk -- as Gtk
import qualified GI.Gtk as Gtk
import Data.GI.Base
import qualified Data.GI.Base.GObject as GO
import Data.Text
{-

============================================================================ NFG ===================================================================
Created a simple window in Glade and saved as MyGlade.glade.
I can load and parse the glade file, but nothing works from there.
The result of builderGetObject is a GObject, which does not work with any of the previous work I did when manually creating windows, buttons, etc.


-}

mainWindow :: IO ()
mainWindow = do
--  gladeFile <- getDataFileName "data/gui.glade"
  --Gtk.init Nothing

  --win <- new Gtk.Window [ #title := "Hi there" ]
  
  -- _ <- GI.Gtk.init Nothing
  
  builder <- GI.Gtk.builderNewFromFile "src/Glade/MyGlade.glade" -- (pack gladeFile)
  
  winObj <- builderGetObject builder "Charter"
  
  --win <- castTo Window winObj
  --win <- fromGValue winObj
  --label <- builderGetObject builder "label"
  
  -- widgetShowAll  winObj
  -- #add win label
  
  --on win #destroy Gtk.mainQuit
  -- #showAll winObj


  Gtk.main
