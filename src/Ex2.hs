module Ex2 where

data A
data B
data C
newtype F a = F a

f :: C -> B
f = undefined

g :: A -> B
g = undefined

instance Functor F where
    fmap x (F a) = F $ x a
