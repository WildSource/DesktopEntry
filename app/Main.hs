module Main where

type Scope = String
type AppName = String
type Content = String

writeDE :: IO () 
writeDE s a e i =
  let fileContent =    
    "[Desktop Entry]" <>
    "Type=Application" <>
    "Name=" <> a <>
    "Exec=" <> e <>
    "Icon=" i   
  in write s (filter (" " ==) a) fileContent
  where
    write :: Scope -> AppName -> Content -> IO ()
    write "G" a c = 
      writeFile ("/usr/share/applications/" <> a <> ".desktop") c
    write "U" a c = 
      writeFile ("~/.local/share/applications/" <> a <> ".desktop") c 

validateOptions :: [String] -> IO String
validateOptions options = 
  let option = getLine
  if elem option options
  then option
  else putStrLn "Not a valid option, try again." >> validateOptions options

fileCheck :: Path -> IO ()
fileCheck = undefined 

main :: IO ()
main = do
  putStrLn "Global or User-Specific Desktop Entry ?" 
  putStrLn "(G/U)"
  scope <- validateOptions [
    "G", "U", "g", "u", 
    "Global", "User", 
    "global", "user"
  ]
  
  putStrLn "What is the name of the app ?"
  appName <- getLine
  
  putStrLn "Enter the executable's Path:"
  execPath <- getLine

  putStrLn "Enter the Icon's path (optional)"
  putStrLn "(default: none)"
  iconPath <- getLine

  writeDE scope appName execPath iconPath 
