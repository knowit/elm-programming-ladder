module Page.Home exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main =
  div [ class "content-main" ] 
    [ h1 [] [ text "KODEKALENDER"]
    , h3 [] [ text "by Knowit"]
    , text "Løs lukene og bli med i trekningen av en telefon eller et nettbrett. En ny luke åpnes hver dag frem til jul"
    ]