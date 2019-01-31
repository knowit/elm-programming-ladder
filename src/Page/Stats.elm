module Page.Stats exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

main =
    div [ class "content-main" ]
        [ h1 [] [ text "Ledertavle" ]
        , table [] <|
            [tr []
                [ th [] [ text "Plass" ]
                , th [] [ text "Bruker"]
                ]
            ]
            ++ (List.map viewUser users)
        ]
                

viewUser: User -> Html msg
viewUser user = 
    tr []
        [ th [] [ text (String.fromInt user.score) ]
        , th [] [ text user.name ]
        ]

-- Users (Temp)

type alias User = 
    { name: String
    , score: Int
    }

users: List User
users =
    [ User "User 1" 1
    , User "User 2" 2
    , User "User 3" 3
    , User "User 4" 4
    , User "User 5" 5
    ]