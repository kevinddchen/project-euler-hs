import Mathfuncs (isPrime)

result :: Int
result = filter isPrime [2 ..] !! 10000

main :: IO ()
main = print result
