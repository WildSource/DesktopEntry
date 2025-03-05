module Main where

type Scope = String
type AppName = String
type Content = String
type ExecPath = String
type IconPath = String 

writeDE :: Scope -> AppName -> ExecPath -> IconPath -> IO () 
writeDE s a e i =
  let fileContent = "[Desktop Entry]\n" <> "Type=Application\n" <> "Name=" <> a <> "\nExec=" <> e <> "\nIcon=" <> i   
  in write s (filter (' ' ==) a) fileContent
  where
    write :: Scope -> AppName -> Content -> IO ()
    write "G" a c = 
      writeFile ("/usr/share/applications/" <> a <> ".desktop") c
    write "U" a c = 
      writeFile ("~/.local/share/applications/" <> a <> ".desktop") c 
    write _ a c = 
      error "Not a valid Scope"
    where
      write' = undefined

fileCheck :: String -> IO Bool
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

  writeDE scope appName execPath iconPath 
