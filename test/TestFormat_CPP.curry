------------------------------------------------------------------------------
--- This program contains some examples for integrated code to support
--- string formatting. It has been generated from `TestFormat.curry`
--- with the Curry preprocessor!
---
--- The format specification follows the C specification for `printf`
--- formatting whch may be found at
--- <http://pubs.opengroup.org/onlinepubs/009695399/functions/fprintf.html>
------------------------------------------------------------------------------
 

import Data.Format -- required in the pre-processed program
import Test.Prop

-- Format a string and an integer:
ex1 :: String -> Int -> String
ex1 name age =  ("Hello " ++ (Data.Format.showString ('s') (Nothing) (Nothing) (Nothing) name) ++ ", you are " ++ (Data.Format.showInt ('i') (Nothing) (Nothing) (Nothing) age) ++ " years old.")

testEx1 = (ex1 "Mike" 42) -=- "Hello Mike, you are 42 years old."

-- Format two integers:
ex2 :: Int -> Int -> String
ex2 n1 n2 =  ((Data.Format.showInt ('d') (Just "+") (Nothing) (Just 5) n1) ++ " and " ++ (Data.Format.showInt ('i') (Just " ") (Just 10) (Just 4) n2))

testEx2 = (ex2 12345 34) -=- "+12345 and       0034"

testInt5            =  ((Data.Format.showInt ('i') (Nothing) (Nothing) (Just 5) 42))    -=- "00042"

testIntSigned5      =  ((Data.Format.showInt ('d') (Just "+") (Nothing) (Just 5) 42))   -=- "+00042"

testIntFixedSigned5 =  ((Data.Format.showInt ('i') (Just "+") (Just 10) (Just 5) 42)) -=- "    +00042"

-- Format a charater:
ex3 :: Char -> String
ex3 c =  ("This is a char: " ++ (Data.Format.showChar ('c') (Nothing) (Nothing) (Nothing) c))

testEx3 = (ex3 'a') -=- "This is a char: a"

-- Integer and character formatting:
testIntFixedSignedChar =   ((Data.Format.showInt ('d') (Just "+") (Just 5) (Nothing) 42) ++ (Data.Format.showChar ('c') (Nothing) (Nothing) (Nothing) c))  -=-  "  +42%"
  where
   c = '%'                           

-- Format a string with a given width and maximal length:
ex4 :: String -> String
ex4 s =  ("This is a string: " ++ (Data.Format.showString ('s') (Just "0") (Just 10) (Just 4) s) ++ "!")

testEx4 = (ex4 "Hello") -=- "This is a string:       Hell!"

-- Format with passing expressions:
ex8 :: Int -> Int -> String
ex8 n1 n2 =  ("The sum of " ++ (Data.Format.showInt ('d') (Just "+") (Nothing) (Just 5) n1) ++ " and " ++ (Data.Format.showInt ('i') (Just "+") (Just 5) (Nothing) n2) ++ " is " ++ (Data.Format.showInt ('i') (Just "+") (Just 6) (Nothing) (n1+n2)) ++ ".\n")

test_intexp = (ex8 42 2143) -=- "The sum of +00042 and +2143 is  +2185.\n"

-- Format a float with a given width and precision:
testFloatFixPrec3 =  ((Data.Format.showFloat ('f') (Just "+") (Just 8) (Just 3) f)) -=- "  +3.142"
 where
  f = 3.14159
  
-- Format a float with an exponent:
testFloatExp =  ((Data.Format.showFloat ('E') (Just " ") (Nothing) (Just 4) f)) -=- " 3.1416E+02"
 where
  f = 314.159

-- Format the sum of two integers:
ex7 :: Int -> Int -> String
ex7 n1 n2 =  ("The sum of " ++ (Data.Format.showInt ('d') (Just "+") (Nothing) (Just 5) n1) ++ " and " ++ (Data.Format.showInt ('i') (Just "+") (Just 5) (Nothing) n2) ++ " is " ++ (Data.Format.showInt ('i') (Just "+") (Just 6) (Nothing) (n1+n2)))

testEx7 = (ex7 1234 890) -=- "The sum of +01234 and  +890 is  +2124"
