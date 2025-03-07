module Main where

import System.Directory (doesFileExist)

type Scope = String
type AppName = String
type Content = String
type ExecPath = String
type IconPath = String 
type DeskEntryPath = String

writeDE :: Scope -> AppName -> ExecPath -> IconPath -> String 
writeDE s a e i =
  let name = filter (' ' ==) a
      content' = content name e i 
  in  write s name content'
  where
    write :: Scope -> AppName -> Content -> String 
    write "G" a c = 
      let path' = path "G" a 
      in writeFile (path') c >> path'
    write "U" a c = 
      let path' = path "U" a 
      in writeFile (path') c >> path'
    write _ a c = 
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

fileCheck :: String -> IO () 
fileCheck path =
  doesFileExist path >>= isSuccess 
  where
    isSuccess :: Bool -> IO ()
    isSuccess True = putStrLn "Desktop Entry was created !"
    isSuccess False = putStrLn "Desktop Entry's creation failed !"

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

  putStrLn "Hello"
