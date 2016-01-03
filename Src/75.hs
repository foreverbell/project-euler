
import Data.Array.MArray
import Data.Array.IO
import Control.Monad (foldM, mapM_)
import Common.Util (isqrt, if')

type IntArray = IOArray Int Int

limit = 1500000 :: Int
limit' = isqrt $ limit `div` 2
candidate = [ (m, n) | m <- [1 .. limit'], n <- [1 .. m - 1], gcd m n == 1, odd (m + n) ]

incArray :: IntArray -> Int -> IO ()
incArray arr index = (readArray arr index) >>= ((writeArray arr index) . succ)

update :: Int -> Int -> IntArray -> IO ()
update m n arr = do
    let a = m^2 - n^2
    let b = 2*m*n
    let c = m^2 + n^2
    let p = a + b + c
    let xs = takeWhile (\x -> x <= limit) [p, p + p .. ]
    mapM_ (\x -> incArray arr x) xs

main = do
    arr <- newArray (0, limit) 0 :: IO IntArray
    mapM (\(m ,n) -> update m n arr) candidate
    (foldM helper (0, arr) [0 .. limit]) >>= (print . fst) 
    where helper (s, arr) index = do
            val <- readArray arr index
            return $ if' (val == 1) (s + 1, arr) (s, arr)

