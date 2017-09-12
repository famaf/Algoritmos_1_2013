module Container where


class Container a where

        empty :: a b c
        add :: (Ord b) => b -> c -> a b c -> a b c
        search :: (Ord b) => b -> a b c -> Maybe c
        del :: (Ord b) => b -> a b c -> a b c
        toListPair :: a b c -> [(b,c)]
