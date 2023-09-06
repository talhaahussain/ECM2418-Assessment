-- any imports go here

{-Begin Question 1.1-}

digits :: Int -> [Int]
digits 0 
  = []
digits x 
  = digits(x `div` 10) ++ [x `mod` 10]
  
{-End Question 1.1-}


{-Begin Question 1.2-}

splitter :: Int -> ([Int], [Int])
splitter e 
  = splitAt 2 (digits e)

contains :: [Int] -> Int -> Bool
contains [] e
  = False
contains (x:xs) e
  | x == e = True
  | otherwise = contains xs e
  
repeats :: [Int] -> Bool
repeats []
  = False
repeats (x:xs)
  | contains xs x = True
  | otherwise = repeats xs 

isPar :: Int -> Bool
isPar e
  | (((snd (splitter e)) !! 0 * 10) + ((snd (splitter e)) !! 1)) `mod` (((fst (splitter e)) !! 0 * 10) + ((fst (splitter e)) !! 1)) == 0 && not (repeats (digits e)) && not (contains (digits e) 0) = True
  | otherwise = False

producer :: [Int]
producer 
  = [1000 .. 9999]
  
consumer :: [Int] -> [Int]
consumer
  = filter isPar

pars :: [Int]
pars
  = consumer producer
  
{-End Question 1.2-}


{-Begin Question 1.3-}

findMissing :: [Int] -> Int
findMissing xs
  =  45 - sum xs

combineDigits :: [Int] -> Int
combineDigits xs
  = (xs !! 0 * 1000) + (xs !! 1 * 100) + (xs !! 2 * 10) + (xs !! 3)

isParty :: (Int, Int) -> Bool
isParty e
  | (isPar (fst e)) && (isPar (snd e)) && not (repeats (digits (fst e) ++ digits (snd e))) && (((fst e) `mod` (findMissing (digits (fst e) ++ digits (snd e)))) == 0) && (((snd e) `mod` (findMissing (digits (fst e) ++ digits (snd e)))) == 0) = True
  | otherwise = False

producerNew :: [(Int, Int)]
producerNew
  = [(x, y) | x <- pars, y <- pars]

consumerNew :: [(Int, Int)] -> [(Int, Int)]
consumerNew
  = filter isParty
  
partys :: [(Int, Int)]
partys
  = consumerNew producerNew

{-End Question 1.3-}


-- any main functions for testing goes here