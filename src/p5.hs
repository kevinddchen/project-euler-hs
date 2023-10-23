import Data.Map qualified as Map
import Mathfuncs

-- | Prime factorization of the number in question.
factorization :: Map.Map Int Int
factorization = Map.fromListWith max $ concatMap primeFactorize [1 .. 20]

result :: Int
result = foldl (\x (p, k) -> x * p ^ k) 1 $ Map.toList factorization

main :: IO ()
main = print result
