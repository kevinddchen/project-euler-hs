isPalindrome :: (Show a) => a -> Bool
isPalindrome x = let s = show x in s == reverse s

result :: Int
result = maximum $ filter isPalindrome [x * y | x <- [100 .. 999], y <- [100 .. 999]]

main :: IO ()
main = print result
