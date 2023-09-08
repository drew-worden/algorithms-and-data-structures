--Implementation of the Z Algorithm in Haskell
--by Drew Worden

zArray :: String -> [Int]
zArray str = 
    let n = length str
        z = 0 : [0 | _ <- [1..(n - 1)]]
        (l, r) = (0, 0)
        zArray' i j acc
            | i >= n = acc
            | i > r = 
                let z' = zArrayNaive str i i
                in zArray' (i + 1) (i + z' - 1) (acc ++ [z'])
            | otherwise = 
                let k = i - l
                    beta = r - i + 1
                    if z !! k < beta
                        then zArray' i j (acc ++ [z !! k])
                        else 
                            let z' = zArrayNaive str i (r + 1)
                            in zArray' (i + 1) (r + z' - 1) (acc ++ [z'])
        zArrayNaive s p1 p2
            | p2 >= length s = length (takeWhile (\(x, y) -> x == y) (zip (drop p1 s) (drop p2 s)))
            | otherwise = length (takeWhile (\(x, y) -> x == y) (zip (drop p1 s) (drop p2 s)))
    in zArray' 1 0 [0]

zSearch :: String -> String -> [Int]
zSearch pattern text = 
    let concatStr = pattern ++ "$" ++ text
        zArr = zArray concatStr
        patternLen = length pattern
        zArrLen = length zArr
    in [i | i <- [0..(zArrLen - 1)], zArr !! i == patternLen]
    
main :: IO ()
main = do
    let text = "ABABABABABABABA"
        pattern = "ABA"
        matches = zSearch pattern text
    putStrLn $ "Pattern found at indices: " ++ show matches
