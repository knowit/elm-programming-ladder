module Page.Home exposing (viewHome)

{- Home page, static page showing when entering the programming ladder

   This page is static as it currently have no functionality except displaying text.
   Examples of dynamic pages are Stats and Challenges
-}

import Html exposing (..)
import Html.Attributes exposing (..)



-- MODEL
-- UPDATE
-- VIEW


viewHome : Html msg
viewHome =
    div [ class "content-main" ]
        [ h1 [] [ text "KODEKALENDER" ]
        , h3 [] [ text "by Knowit" ]
        , text "Løs lukene og bli med i trekningen av en telefon eller et nettbrett. En ny luke åpnes hver dag frem til jul"
        ]
