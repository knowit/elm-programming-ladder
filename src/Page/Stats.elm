module Page.Stats exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL

type alias Model = 
    { userGroups: List UserGroup }


init: List UserGroup -> (Model, Cmd Msg)
init groups = 
    let 
        model = 
            { userGroups = groups }
    in (model, Cmd.none)
        

-- UPDATE

type Msg
    = NoOp

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

-- VIEW

view: Model -> Html Msg
view { userGroups } = 
    div [ class "content-main" ]
        [ h1 [] [ text "Ledertavle" ]
        , table []
            ([ thead []
                [ th [] [ text "Plass" ]
                , th [] [ text "Bruker"]
                ]
            ]
                ++ List.map viewUserGroup userGroups
            )
        ]


viewUserGroup: UserGroup -> Html msg
viewUserGroup userGroup =
    tbody [] 
        ([ tr []
            [ th [] [text (String.fromInt userGroup.score ++ " luker")] ] 
            ]
        ++ List.map viewUser userGroup.users
        )
    

viewUser: User -> Html msg
viewUser user = 
    tr []
        [ th [] [ text (String.fromInt user.score) ]
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