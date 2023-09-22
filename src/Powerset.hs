{-# LANGUAGE InstanceSigs #-}

-- this is not complete

module Powerset where

import Data.List

newtype Set a = Set {runSet :: [a]}
    deriving Show

fromList :: Eq a => [a] -> Set a
fromList xs = Set $ nub xs

instance Functor Set where
    fmap f (Set xs) = Set $ f <$> xs

instance Applicative Set where
    pure x = Set [x]
    Set f <*> Set a = Set $ f <*> a

instance Monad Set where
    return = pure
    (>>=) :: Set a -> (a -> Set b) -> Set b
    Set xs >>= f = Set $ [y | x <- xs, y <- runSet $ f x]
