tgl :: Int -> Int
tgl n = foldl (+) 0 [1 .. n]

triangleSequence :: Int -> [Int]
triangleSequence n = map tgl [1 .. n]

vowels = "aeiou"

vowelCount :: String -> Int
vowelCount = length . filter (\x -> elem x vowels)

lcsim :: (a -> b) -> (a -> Bool) -> [a] -> [b]
lcsim f p items = map f (filter p items)