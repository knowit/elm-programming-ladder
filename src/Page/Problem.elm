module Page.Problem exposing
    ( notFound
    , offline
    , styles
    )

{- Error page

   should move styling to styles.css
-}

import Html exposing (..)
import Html.Attributes exposing (..)



-- NOT FOUND


notFound : Html msg
notFound =
    div [ class "content-main" ]
        [ div [ style "font-size" "12em" ] [ text "404" ]
        , div [ style "font-size" "3em" ] [ text "I cannot find this page!" ]
        ]


styles : List (Attribute msg)
styles =
    [ style "text-align" "center"
    , style "color" "#9A9A9A"
    , style "padding" "6em 0"
    ]



-- OFFLINE


offline : String -> List (Html msg)
offline file =
    [ div [ style "font-size" "3em" ]
        [ text "Cannot find "
        , code [] [ text file ]
        ]
    , p [] [ text "Are you offline or something?" ]
    ]
