import Mathfuncs (isPrime)

result :: Int
result = sum . filter isPrime $ [2 .. 2000000]

main :: IO ()
main = print result
