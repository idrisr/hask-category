module Law1 where

join :: Monad m => m (m a) -> m a
join x = x >>= id

law1a, law1b :: Monad m => m (m (m a)) -> m a
law1a = join . join
{- hlint ignore "Use =<<" -}
law1b = join . fmap join

xs :: [[[Int]]]
xs =
    [
        [ [5, 1, 0]
        , [2, 2, 5]
        , [5, 5, 3, 3]
        ]
    ,
        [ [8, 9, 3]
        , [7, 2, 4]
        , [9]
        ]
    ]

ys :: Maybe (Maybe (Maybe Int))
ys = Just $ Just $ Just 69
