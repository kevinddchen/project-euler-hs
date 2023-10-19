fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
result = sum (takeWhile (< 4000000) (filter even fibs))

main :: IO ()
main = print result
