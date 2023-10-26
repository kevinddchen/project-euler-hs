import Data.Char qualified as Char
import System.IO (IOMode (ReadMode), hGetContents, withFile)

removeNewLines :: String -> String
removeNewLines = filter (/= '\n')

toIntList :: String -> [Int]
toIntList = map Char.digitToInt

-- | Given `size` and `list`, compute the product of the elements at indices
-- `[index .. index + size]`. If the window extends past the end of the list,
-- returns 0.
windowProduct :: Int -> [Int] -> Int -> Int
windowProduct size list index
  | index + size > length list = 0
  | otherwise = product . take size . drop index $ list

windowSize :: Int
windowSize = 13

main :: IO ()
main = do
  withFile
    "files/p8.txt"
    ReadMode
    ( \handle -> do
        contents <- hGetContents handle
        let digits = toIntList . removeNewLines $ contents
            products = map (windowProduct windowSize digits) [0 .. length digits]
            result = maximum products
        print result
    )
