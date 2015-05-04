import Data.Array

primesTo m = eratos [2 .. m] where
    eratos []     = []
    eratos (p:xs) = p : eratos (xs `minus` [p*p, p*p+p .. m])
    minus (x:xs) (y:ys) = case (compare x y) of 
        LT -> x : minus xs (y:ys)
        EQ -> minus xs ys 
        GT -> minus (x:xs) ys
    minus xs _ = xs

find num (p:ps)
    | num * p > 1000000 = num
    | otherwise = find (num * p) ps

main = print $ find 1 (primesTo 1000)