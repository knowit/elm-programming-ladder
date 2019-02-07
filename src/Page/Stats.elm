module Page.Stats exposing (viewStats)

import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL (not used)

type alias Model = 
    { userGroups: List UserGroup }


init: List UserGroup -> (Model, Cmd Msg)
init groups = 
    let 
        model = 
            { userGroups = groups }
    in (model, Cmd.none)
        

-- UPDATE (not used)

type Msg
    = NoOp

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

-- VIEW

viewStats: Html msg
viewStats = 
    div [ class "content-main" ]
        [ h1 [] [ text "Ledertavle" ]
        , table 
            [ style "width" "100%"
            , style "border-collapse" "collapse"
            , style "text-align" "left" 
            ]
            ([ thead 
                [ style "background" "rgb(0, 0, 0)"
                , style "color" "rgb(250, 250, 250)"]
                [ th [style "width" "10%"] [ text "Plass" ]
                , th [] [ text "Bruker"]
                ]
            ]
                ++ List.map viewUserGroup tempGroups
            )
        ]


viewUserGroup: UserGroup -> Html msg
viewUserGroup userGroup =
    tbody [] 
        ([ tr 
            [ style "background" "rgb(0, 0, 0)"
            , style "color" "rgb(250, 250, 250)"
            , style "text-align" "center"
            ]
            [ th [ colspan 2 ] [text (String.fromInt userGroup.score ++ " luker")] ] 
            ]
        ++ List.map viewUser userGroup.users
        )
    

viewUser: User -> Html msg
viewUser user = 
    tr []
        [ th [] [ text (String.fromInt user.score ++ ".") ]
        , th [] [ text user.name ]
        ]
    

-- USERS (Temp)

type alias UserGroup = 
    { score: Int
    , users: List User
    }

tempGroups: List UserGroup
tempGroups = 
    [ UserGroup 24 users1 
    , UserGroup 23 users2
    ]

type alias User = 
    { name: String
    , score: Int
    }

users1: List User
users1 =
    [ User "User 1" 1
    , User "User 2" 1
    , User "User 3" 1
    , User "User 4" 1
    , User "User 5" 1
    ]

users2: List User
users2 =
    [ User "User 6" 2
    , User "User 7" 2
    , User "User 8" 2
    , User "User 9" 2
    ]