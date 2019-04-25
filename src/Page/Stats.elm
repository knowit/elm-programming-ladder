module Page.Stats exposing (Model, Msg, init, update, viewStats)

import Graphcool.InputObject
import Graphcool.Interface
import Graphcool.Object
import Graphcool.Object.User as User
import Graphcool.Query as Query
import Graphcool.Scalar
import Graphcool.ScalarCodecs
import Graphql.Document as Document
import Graphql.Http
import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import Html exposing (..)
import Html.Attributes exposing (..)
import RemoteData exposing (RemoteData)

{-
    Collects and displays the leaderboard
-}

-- REQUEST

{- The response is a list of users -}
type alias Response =
    List UserLookup

{- Creates the query -}
query : SelectionSet Response RootQuery
query =
    Query.allUsers (\optionals -> { optionals | first = Present 20 }) user -- Change to {optionals | filter = Present ...(idk) } user


{- The type the response is decoded to. Expand to collect more fields, some fields might need authentication. Called UserLookup to avoid confusion -}
type alias UserLookup =
    { nickname : String
    }

{- Expand to collect more fields, some fields might need authentication -}
user : SelectionSet UserLookup Graphcool.Object.User
user =
    SelectionSet.map UserLookup
        User.nickname


makeRequest : String -> Cmd Msg
makeRequest api =
    query
        |> Graphql.Http.queryRequest api
        |> Graphql.Http.send (RemoteData.fromResult >> GotResponse)



-- MODEL

{- Stores the status of the resquest in a RemoteData type, which is either Success, Failure, NotAsked or Loading -}
type alias Model =
    RemoteData (Graphql.Http.Error Response) Response


type alias Flags =
    ()

{- Initializes the module by setting the model to Loading and making the request -}
init : String -> ( Model, Cmd Msg )
init api =
    ( RemoteData.Loading, makeRequest api )



-- UPDATE


type Msg
    = GotResponse Model

{- Collects the response from the GraphQL server -}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResponse response ->
            ( response, Cmd.none )



-- VIEW

{- Displays the results of the request -}
viewStats : Model -> Html msg
viewStats model =
    let
        content = 
            case model of
                RemoteData.Success users ->
                    viewUsers users
                RemoteData.Failure error ->
                    text ("Error: " ++ Debug.toString error)
                _ ->
                    text "Loading..."
                
    in
    div [ class "content-main" ]
        [ h1 [] [ text "Ledertavle" ]
        ,  content 
        ]

{- Creates the users table -}
viewUsers: List UserLookup -> Html msg 
viewUsers users =
    div []
        [ table [ class "stats-table" ]
            ([ thead [ class "stats-table-head" ]
                [ th [] [ text "Plass" ]
                , th [] [ text "Bruker" ]
                ]
            ]
                ++ List.map viewUser users
            )
        ]
{- Creates each user row -}
viewUser: UserLookup -> Html msg 
viewUser userLookup =
    tr []
        [ th [] [ text "??" ]
        , th [] [ text userLookup.nickname ]
        ]

{- 
    Users need to be sorted into groups based on their score/position, 
    after collecting relevant users from the graphQL server.
    Below is a view setup for grouping users in the table 
-}
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
        [ th [] [ text (String.fromInt user.position ++ ".") ]
        , th [] [ text user.name ]
        ]
-}
