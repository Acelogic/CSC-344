reverseWords :: String -> String
reverseWords = unwords . reverse . words

averageWordLength :: String -> Float
averageWordLength s = fromIntegral totalSentenceLength / fromIntegral (length sentWords)
    where
     wordLengths = map length (words s)
     totalSentenceLength = sum wordLengths
     sentWords = words s