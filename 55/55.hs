
isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [a] = True
isPalindrome (x:xs) = if x == last xs then isPalindrome (init xs) else False

isLychrel :: Integer -> Bool
isLychrel x = helper 1 x
    where
        helper n x
            | n >= 50 = True
            | isPalindrome (show y) = False
            | otherwise = helper (n + 1) y
            where y = x + ((read . reverse . show) x)
main = do
    print $ length $ filter isLychrel [1 .. 9999]
