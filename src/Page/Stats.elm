module Page.Stats exposing (viewStats, Model, Msg, init, update)

import Html exposing (..)
import Html.Attributes exposing (..)
import Graphql.Operation exposing (RootQuery)
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import Graphql.Http
import Graphql.Document as Document
import Graphql.OptionalArgument exposing(OptionalArgument(..))
import RemoteData exposing(RemoteData)
import Graphcool.Interface
import Graphcool.Query as Query
import Graphcool.ScalarCodecs
import Graphcool.Object
import Graphcool.Object.User as User
import Graphcool.Scalar
import Graphcool.InputObject

-- REQUEST

type alias Response = 
    List UserLookup

query : SelectionSet Response RootQuery
query =
    Query.allUsers (\optionals -> { optionals | first = Present 100 }) user
    -- Change to {optionals | filter = Present ...(idk) } user



type alias UserLookup = 
    { email : Maybe String 
    , createdAt: Graphcool.Scalar.DateTime
    }

user : SelectionSet UserLookup Graphcool.Object.User
user = 
    SelectionSet.map2 UserLookup
        User.email
        User.createdAt

makeRequest : Cmd Msg
makeRequest = 
    query
        |> Graphql.Http.queryRequest "https://api.graph.cool/simple/v1/knowit-programming-ladder"
        |> Graphql.Http.send (RemoteData.fromResult >> GotResponse)

-- MODEL

type alias Model =
    RemoteData (Graphql.Http.Error Response) Response

type alias Flags = 
    ()

init : (Model, Cmd Msg)
init =
    (RemoteData.Loading, makeRequest)

-- UPDATE

type Msg   
    = GotResponse Model

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of 
        GotResponse response ->
            ( response, Cmd.none)

-- VIEW

viewStats : Model -> Html msg
viewStats model = 
    div [ class "content-main" ]
        [ div []
            [ h1 [] [ text "Generated Query" ]
            , pre [] [ text (Document.serializeQuery query) ]
            ]
        , div []
            [ h1 [] [ text "Response" ]
            , text (Debug.toString model)
            ]
        ]
    

{-
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
-}

{-
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
-}