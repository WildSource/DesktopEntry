module Main where

import System.Directory (doesFileExist)

type Scope = String
type AppName = String
type Content = String
type ExecPath = String
type IconPath = String 
type DeskEntryPath = String

writeDE :: Scope -> AppName -> ExecPath -> IconPath -> IO String 
writeDE s a e i =
  let name = filter (' ' /=) a
      content' = content name e i 
  in  write s name content'
  where
    write :: Scope -> AppName -> Content -> IO String 
    write "G" a' c = 
      let path' = path "G" a' 
      in writeFile path' c >> pure path'
    write "U" a' c = 
      let path' = path "U" a' 
      in writeFile path' c >> pure path'
    write _ _ _ = 
      error "Not a valid Scope" 

    content :: AppName -> ExecPath -> IconPath -> String
    content name exec icon = 
      "[Desktop Entry]\n" <> 
      "Type=Application\n" <> 
      "Name=" <> name <> 
      "\nExec=" <> exec <> 
      "\nIcon=" <> icon   

    path :: Scope -> AppName -> DeskEntryPath 
    path "G" name = "/usr/share/applications/" <> name <> ".desktop"
    path "U" name = "~/.local/share/applications/" <> name <> ".desktop"
    path _ name = error "Scope error for AppName: " <> name

fileCheck :: String -> IO () 
fileCheck path =
  doesFileExist path >>= isSuccess path 
  where
    isSuccess :: String -> Bool -> IO ()
    isSuccess path' True = putStrLn $ "Desktop Entry " <> path' <> " was created !"
    isSuccess path' False = putStrLn $ "Desktop Entry's " <> path' <> " creation failed !"

main :: IO ()
main = do
  putStrLn "Global or User-Specific Desktop Entry ?" 
  putStrLn "(G/U)"
  scope <- getLine
  
  putStrLn "What is the name of the app ?"
  appName <- getLine

  putStrLn "Enter the executable's Path:"
  execPath <- getLine

  putStrLn "Enter the Icon's path (optional)"
  putStrLn "(default: none)"
  iconPath <- getLine

  dePath <- writeDE scope appName execPath iconPath

  fileCheck dePath
