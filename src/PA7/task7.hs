a :: [Int]
a = [2, 5, 1, 3]

b :: [Int]
b = [1, 3, 6, 2, 5]

c :: [Int]
c = [4, 4, 2, 1, 1, 2, 2, 4, 4, 8]

u :: [Int]
u = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]

x :: [Int]
x = [1, 9, 2, 8, 3, 7, 2, 8, 1, 9]

pairwiseValues :: [Int] -> [(Int, Int)]
pairwiseValues xs = zip (init xs) (tail xs)

pairwiseDifferences :: [Int] -> [Int]
pairwiseDifferences xs = map (\(x, y) -> x - y) $ pairwiseValues xs

pairwiseSums :: [Int] -> [Int]
pairwiseSums xs = map (\(x, y) -> x + y) $ pairwiseValues xs

half :: Int -> Double
half n = fromIntegral n / 2

pairwiseHalves :: [Int] -> [Double]
pairwiseHalves = map (\x -> fromIntegral x / 2)

pairwiseHalfSums :: [Int] -> [Double]
pairwiseHalfSums = pairwiseHalves . pairwiseSums

pairwiseTermPairs :: [Int] -> [(Int, Double)]
pairwiseTermPairs xs = zip (pairwiseDifferences xs) (pairwiseHalfSums xs)

term :: (Int, Double) -> Double
term nd = abs (fromIntegral (fst nd) / snd nd)

pairwiseTerms :: [Int] -> [Double]
pairwiseTerms xs = map term (pairwiseTermPairs xs)

nPVI :: [Int] -> Double
nPVI xs = normalizer xs * sum (pairwiseTerms xs)
    where
    normalizer xs = 100 / fromIntegral ((length xs) - 1)