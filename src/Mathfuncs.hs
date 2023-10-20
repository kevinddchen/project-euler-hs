module Mathfuncs
  ( smallestPrimeFactor,
    primeFactorize,
  )
where

-- | Returns the smallest prime factor of a number.
smallestPrimeFactor :: (Integral a) => a -> a
smallestPrimeFactor n
  | n <= 1 = error "n must be greater than 1"
  | otherwise =
      let nums = takeWhile (\x -> (x * x) <= n) (2 : [3, 5 ..]) ++ [n]
       in head (filter (\x -> n `mod` x == 0) nums)

-- | Returns the prime factors of a number, e.g. 12 -> [2,2,3]
primeFactorize :: (Integral a) => a -> [a]
primeFactorize n
  | n < 1 = error "n must be greater than 0"
  | n == 1 = []
  | otherwise = let k = smallestPrimeFactor n in k : primeFactorize (n `div` k)
