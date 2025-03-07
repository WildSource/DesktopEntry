{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_filepath (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "filepath"
version :: Version
version = Version [1,5,4,0] []

synopsis :: String
synopsis = "Library for manipulating FilePaths in a cross platform way."
copyright :: String
copyright = "Neil Mitchell 2005-2020, Julian Ospald 2021-2022"
homepage :: String
homepage = "https://github.com/haskell/filepath/blob/master/README.md"
