module ListMap exposing
  ( ListMap
  , get
  , set
  )

{-| An Elm package that implements a key value store a a simple `List` of pairs.  Although this is horribly
inefficient, it allows you to have any values as the key without having to worry about implementing
comparators or hash functions.

Useful if you know that you aren't going to have a very long list.

@docs ListMap, get, set
-}

import List.Extra exposing (find, dropWhile)


{-| The ListMap type with a specified key and value.  The key can be any type.
-}
type alias ListMap key value =
  List (key, value)


{-| Look for the given key in the ListMap.  If the key can't be found this returns
Nothing.
-}
get : key -> ListMap key value -> Maybe value
get key listMap =
  listMap
    |> find (\(k, _) -> k == key)
    |> Maybe.map snd


{-| Replace or insert the given key value and return the updated ListMap.
-}
set : key -> value -> ListMap key value -> ListMap key value
set key value listMap =
  listMap
    |> dropWhile (\(k, _) -> k == key)
    |> (::) (key, value)
