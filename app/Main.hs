module Main where

import System.Process
import System.IO

-- import Lib

flush :: IO ()
flush = hFlush stdout

craftDisplayText :: String -> String
craftDisplayText msg = "Algebra.λ> " ++ msg

say :: String -> IO ()
say s = putStr s *> flush

sayLn :: String -> IO ()
sayLn s = say $ s ++ "\n"

main :: IO ()
main = do
    system "clear"
    sayLn "I can prove your theorem, cross my heart!"
    mainLoop

mainLoop :: IO ()
mainLoop = do
    say ""
    eof <- isEOF
    if eof then
        putStrLn "(EOF)\nTerminate."
    else
        getLine >>= parseLine >> mainLoop

parseLine :: String -> IO ()
parseLine "" = return ()
parseLine line =
    let prefix = head line
    in
      case prefix of
        '\\' -> parseTexExpression line
        _ -> parseExpression line

parseTexExpression :: String -> IO ()
parseTexExpression tex =
    let expr = tail tex
    in
      do
        -- if isNumber . head expr then

        putStrLn $ craftDisplayText "\"" ++ expr ++ "\""
        return ()

parseExpression :: String -> IO ()
parseExpression expr = return ()