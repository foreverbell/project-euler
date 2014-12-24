import Data.List

sumOfDigit5 = sum . map (^5) . unfoldr helper
    where 
        helper x
            | x == 0    = Nothing
            | otherwise = Just (x `mod` 10, x `div` 10)

main = do
    print $ sum $ filter (\x -> x == (sumOfDigit5 x)) [2 .. 999999]
