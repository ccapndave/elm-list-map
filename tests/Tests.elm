module Tests exposing (..)

import Test exposing (..)
import Expect
import ListMap exposing (..)


all : Test
all =
  describe "ListMap"
    [ setGetTest
    , notFoundTest
    , replaceTest
    ]


setGetTest : Test
setGetTest =
  test "setting and getting" <| \() ->
    let
      result =
        empty
          |> set "dave" 100
          |> get "dave"
    in
    Expect.equal result (Just 100)


notFoundTest : Test
notFoundTest =
  test "missing key" <| \() ->
    let
      result =
        empty
          |> get "dave"
    in
    Expect.equal result Nothing


replaceTest : Test
replaceTest =
  test "replace" <| \() ->
    let
      result =
        empty
          |> set "dave" 100
          |> set "dave" 200
          |> get "dave"
    in
    Expect.equal result (Just 200)