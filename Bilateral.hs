-- any imports go here
import Data.List

{-Begin Question 2.1-}

combine :: Int -> Int -> Int
combine x y
  = read ((show x) ++ (show y))

number :: [Int] -> Int
number xs
  = foldr combine 0 xs `div` 10

{-End Question 2.1-}

{-Begin Question 2.2-}

splitter :: Int -> [a] -> [([a],[a])]
splitter 0 xs
  = []
splitter n xs
  = [splitAt n (xs)] ++ (splitter (n-1) (xs))

splits :: [a] -> [([a],[a])]
splits []
  = []
splits (xs)
  = init (reverse (splitter (length xs) (xs)))

digits :: Int -> [Int]
digits 0 
  = []
digits e 
  = digits(e `div` 10) ++ [e `mod` 10]

isPalindrome :: Int -> Bool
isPalindrome n
  | digits(n) == reverse (digits(n)) = True
  | otherwise = False

isValid :: ([Int],[Int]) -> Bool
isValid e
  | isPalindrome (number (fst(e)) * number (snd(e))) = True
  | otherwise = False

shorter :: ([Int],[Int]) -> [Int]
shorter e
  | length (fst (e)) > length (snd (e)) = snd (e)
  | length (fst (e)) < length (snd (e)) = fst (e)

unnest :: [[([Int],[Int])]] -> [([Int],[Int])]
unnest []
  = []
unnest (x:xs)
  = x ++ unnest(xs)

possibles :: [([Int],[Int])]
possibles
  = unnest (map (splits) (permutations[1,2,3,4,5,6,7,8,9]))
  
{-End Question 2.2-}

{-Begin Question 2.3-}

isAcceptable :: ([Int],[Int]) -> Bool
isAcceptable e
  | (isValid (e)) && (last (shorter (e)) == 3) && (head (digits (number (fst (e)) * number (snd(e)))) == 4) = True
  | otherwise = False
  
acceptables :: [([Int],[Int])]
acceptables
  = filter (isAcceptable) (possibles)

{-End Question 2.3-}


-- any main functions for testing goes here