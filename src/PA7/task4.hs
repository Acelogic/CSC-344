list2Set :: Eq a => [a] -> [a]
list2Set [] = []
list2Set (x : xs)
    | x `elem` xs = list2Set xs
    | otherwise = x : list2Set xs
isPalindrome :: (Eq a, Show a) => [a] -> Bool
isPalindrome [] = True
isPalindrome [x] = True -- (x:_) is the same as [x]!
isPalindrome (x : xs) = x == last xs && isPalindrome (init xs)
collatz :: Int -> [Int]
collatz n
    | n == 1 = [1]
    | even n = n : collatz (n `div` 2)
    | odd n = n : collatz (3 * n + 1)
    | otherwise = []
