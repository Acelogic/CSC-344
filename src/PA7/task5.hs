---- Task 5
list2Set :: Eq a => [a] -> [a]
list2Set [] = []
list2Set (x : xs)
    | x `elem` xs = list2Set xs
    | otherwise = x : list2Set xs
count :: Eq a => a -> [a] -> Int
count x xs = length [s | s <- xs, s == x]

freqTable :: Eq a => [a] -> [(a, Int)]
freqTable items = [(i, count i items) | i <- setOfItems]
    where
        setOfItems = list2Set items