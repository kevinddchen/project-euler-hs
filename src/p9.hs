data Triple = Triple Int Int Int deriving (Show)

sum' :: Triple -> Int
sum' (Triple a b c) = a + b + c

prod' :: Triple -> Int
prod' (Triple a b c) = a * b * c

-- | Given a primitive triple, generate the three child triples according to
-- https://en.wikipedia.org/wiki/Pythagorean_triple#Parent/child_relationships.
genTriples :: Triple -> [Triple]
genTriples (Triple a b c) =
  [ Triple (a - 2 * b + 2 * c) (2 * a - b + 2 * c) (2 * a - 2 * b + 3 * c),
    Triple (a + 2 * b + 2 * c) (2 * a + b + 2 * c) (2 * a + 2 * b + 3 * c),
    Triple ((-a) + 2 * b + 2 * c) ((-2) * a + b + 2 * c) ((-2) * a + 2 * b + 3 * c)
  ]

-- | List of all primitive Pythagorean triples where a + b + c <= 1000.
allTriples :: [Triple]
allTriples = Triple 3 4 5 : concatMap (filter (\t -> sum' t <= 1000) . genTriples) allTriples

-- | Returns True if the sum of the triple is a divisor of 1000.
sumIsDivisor :: Triple -> Bool
sumIsDivisor triple = 1000 `mod` sum' triple == 0

-- | Privitive triple corresponding to the answer.
resultTriple :: Triple
resultTriple = head . filter sumIsDivisor $ allTriples

result :: Int
result = let k = 1000 `div` sum' resultTriple in k * k * k * prod' resultTriple

main :: IO ()
main = print result
