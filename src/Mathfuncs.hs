module Mathfuncs
  ( primeFactorize,
    isPrime,
  )
where

-- | Helper function for `isPrime`, which recursively checks whether n is
-- divisible by an odd number.
_isPrime :: (Integral a) => a -> a -> Bool
_isPrime k n
  | k * k > n = True
  | n `mod` k == 0 = False
  | otherwise = _isPrime (k + 2) n

-- | Returns True if the given number is prime.
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

-- | Helper function for `primeFactorize`, which recursively finds the number
-- of times p divides n for all p.
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
    nextP = if p == 2 then p + 1 else p + 2

-- | Returns the prime factorization of an integer as a list of (prime,
-- exponent) pairs. For example, primeFactorize 12 == [(2,2),(3,1)].
primeFactorize :: (Integral a) => a -> [(a, a)]
primeFactorize = _primeFactorize 2
