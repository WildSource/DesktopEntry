{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_filepath (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,5,4,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/wildsource/.cabal/store/ghc-9.4.8/filepath-1.5.4.0-0c50ac1013febb3aa269e89fc294f2b87cf94496e4ede13238f09f3f83cac66a/bin"
libdir     = "/home/wildsource/.cabal/store/ghc-9.4.8/filepath-1.5.4.0-0c50ac1013febb3aa269e89fc294f2b87cf94496e4ede13238f09f3f83cac66a/lib"
dynlibdir  = "/home/wildsource/.cabal/store/ghc-9.4.8/filepath-1.5.4.0-0c50ac1013febb3aa269e89fc294f2b87cf94496e4ede13238f09f3f83cac66a/lib"
datadir    = "/home/wildsource/.cabal/store/ghc-9.4.8/filepath-1.5.4.0-0c50ac1013febb3aa269e89fc294f2b87cf94496e4ede13238f09f3f83cac66a/share"
libexecdir = "/home/wildsource/.cabal/store/ghc-9.4.8/filepath-1.5.4.0-0c50ac1013febb3aa269e89fc294f2b87cf94496e4ede13238f09f3f83cac66a/libexec"
sysconfdir = "/home/wildsource/.cabal/store/ghc-9.4.8/filepath-1.5.4.0-0c50ac1013febb3aa269e89fc294f2b87cf94496e4ede13238f09f3f83cac66a/etc"

getBinDir     = catchIO (getEnv "filepath_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "filepath_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "filepath_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "filepath_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "filepath_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "filepath_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
