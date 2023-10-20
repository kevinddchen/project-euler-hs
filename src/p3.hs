import Mathfuncs

num :: Int
num = 600851475143

main :: IO ()
main = print (last (primeFactorize num))
