module Mathfuncs
  ( primeFactorize,
    isPrime,
  )
where

_isPrime :: (Integral a) => a -> a -> Bool
_isPrime p n
  | p * p > n = True
  | n `mod` p == 0 = False
  | otherwise = _isPrime (p + 2) n

isPrime :: (Integral a) => a -> Bool
isPrime n
  | n <= 1 = False
  | n == 2 = True
  | even n = False
  | otherwise = _isPrime 3 n

-- | Returns (k, m) where k is the number of times p divides n and m = n / p^k.
_divOut :: (Integral a) => a -> a -> (a, a)
_divOut p n
  | p <= 1 = error "p must be greater than 1"
  | n `mod` p /= 0 = (0, n)
  | otherwise = let (k, m) = _divOut p (n `div` p) in (k + 1, m)

_primeFactorize :: (Integral a) => a -> a -> [(a, a)]
_primeFactorize p n
  | pTooBig && n /= 1 = [(n, 1)]
  | pTooBig = []
  | k > 0 = (p, k) : nextFacts
  | otherwise = nextFacts
  where
    pTooBig = p * p > n
    (k, nextN) = _divOut p n
    nextFacts = _primeFactorize nextP nextN
    nextP = if p `mod` 2 == 1 then p + 2 else p + 1

-- | Returns the prime factorization of an integer as a list of (prime,
-- exponent) pairs. For example, primeFactorize 12 == [(2,2),(3,1)].
primeFactorize :: (Integral a) => a -> [(a, a)]
primeFactorize = _primeFactorize 2
