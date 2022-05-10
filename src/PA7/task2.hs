-- Task 2

squareArea :: Float -> Float
squareArea sideLength = sideLength * sideLength

circleArea :: Float -> Float
circleArea radius = pi * (radius * radius)

blueAreaOfCube :: Float -> Float
blueAreaOfCube sideLength = 6 * (blueArea - whiteArea)
    where
    r = sideLength / 4
    blueArea = squareArea sideLength
    whiteArea = circleArea r
paintedCube1 :: Int -> Int
paintedCube1 degree
    | degree <= 2 = 0
    | otherwise = 6 * (degree - 2) ^ 2
paintedCube2 :: Int -> Int
paintedCube2 degree
    | degree <= 2 = 0
    | otherwise = 12 * (degree - 2)
