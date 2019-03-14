module Page.Stats exposing (viewStats, Model, Msg, init, update)

import Html exposing (..)
import Html.Attributes exposing (..)
import Graphql.Operation exposing (RootQuery)
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import Graphql.Http
import RemoteData exposing(RemoteData)
import Graphcool.Object.User
import Graphcool.Query as Query
import Graphcool.ScalarCodecs

type alias Response = 
    Maybe (Maybe String)

query : SelectionSet Response RootQuery
query =
    Query.user identity Graphcool.Object.User.email

makeRequest : Cmd Msg
makeRequest = 
    query
        |> Graphql.Http.queryRequest "https://api.graph.cool/simple/v1/knowit-programming-ladder"
        |> Graphql.Http.send (RemoteData.fromResult >> GotResponse)

type Msg   
    = GotResponse Model

type alias Model =
    RemoteData (Graphql.Http.Error Response) Response

type alias Flags = 
    ()

init : (Model, Cmd Msg)
init =
    (RemoteData.Loading, makeRequest)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of 
        GotResponse response ->
            ( response, Cmd.none)

{-
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
-} 
-- VIEW
{-
makeRequestAndGetResponse : Model
makeRequestAndGetResponse =
    let
        msg = makeRequest              
    in
        case msg of 
            GotResponse response ->
                response
-}
viewStats : Model -> Html msg
viewStats model = 
    {- let
        model = 
            makeRequestAndGetResponse
    in
    div [ class "content-main" ]
        [ model ]
    -}
    div [ class "content-main" ]
        [ h1 [] [ text "Ledertavle" ]
        , table 
            [ class "stats-table" ]
            ([ thead 
                [ class "stats-table-head" ]
                [ th [ class "stats-table-position-column" ] [ text "Plass" ]
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
            [ class "stats-table-group-head" ]
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
