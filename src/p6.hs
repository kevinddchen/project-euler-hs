square :: (Num a) => a -> a
square x = x * x

result :: Int
result = let nums = [1 .. 100] in (square . sum $ nums) - (sum . map square $ nums)

main :: IO ()
main = print result
