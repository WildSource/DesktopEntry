module Main where

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
