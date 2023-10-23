module Mathfuncs
  ( primeFactorize,
  )
where

-- | Returns (k, m) where k is the number of times p divides n and m = n / p^k.
divOut :: (Integral a) => a -> a -> (a, a)
divOut p n
  | p <= 1 = error "p must be greater than 1"
  | n `mod` p /= 0 = (0, n)
  | otherwise = let (k, newN) = divOut p (n `div` p) in (k + 1, newN)

primeFactorizeHelper :: (Integral a) => a -> a -> [(a, a)]
primeFactorizeHelper p n
  | pTooBig && n /= 1 = [(n, 1)]
  | pTooBig = []
  | k > 0 = (p, k) : nextFacts
  | otherwise = nextFacts
  where
    pTooBig = p * p > n
    (k, nextN) = divOut p n
    nextFacts = primeFactorizeHelper nextP nextN
    nextP = if p `mod` 2 == 1 then p + 2 else p + 1

-- | Returns the prime factorization of an integer as a list of (prime,
-- exponent) pairs. For example, primeFactorize 12 == [(2,2),(3,1)].
primeFactorize :: (Integral a) => a -> [(a, a)]
primeFactorize = primeFactorizeHelper 2
