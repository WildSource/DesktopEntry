{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_DesktopEntry (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "DesktopEntry"
version :: Version
version = Version [0,1,0,0] []

synopsis :: String
synopsis = "A command line tool to generate Debian Desktop Entries"
copyright :: String
copyright = ""
homepage :: String
homepage = ""
