module Main where

writeDE :: IO () 
writeDE s a e i =
  let fileContent =    
    "[Desktop Entry]" <>
    "Type=Application" <>
    "Name=" <> a <>
    "Exec=" <> e <>
    "Icon=" i   
  in write s fileContent
  where
    write :: IO ()
    write = undefined  


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

  putStrLn "Desktop Entry created !"
