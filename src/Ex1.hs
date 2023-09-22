module Ex1 where

data A
data B

f :: B -> A
f = undefined

g :: A -> B
g = undefined

h :: B -> A
h = undefined

ida :: A -> A
ida = undefined

idb :: B -> B
idb = undefined

i = f . (g . h)

j = x . h
    where x = f . g
