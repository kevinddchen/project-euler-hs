import Mathfuncs

result :: Int
result = last . primeFactorize $ 600851475143

main :: IO ()
main = print result
