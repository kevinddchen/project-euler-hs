import Mathfuncs

result :: Int
result = fst . last . primeFactorize $ 600851475143

main :: IO ()
main = print result
