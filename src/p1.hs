result :: Int
result = sum [x | x <- [1 .. 999], x `mod` 3 == 0 || x `mod` 5 == 0]

main :: IO ()
main = print result
