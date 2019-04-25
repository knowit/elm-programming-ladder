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



-- REQUEST


type alias Response =
    List UserLookup


query : SelectionSet Response RootQuery
query =
    Query.allUsers (\optionals -> { optionals | first = Present 20 }) user



-- Change to {optionals | filter = Present ...(idk) } user


type alias UserLookup =
    { nickname : String
    }


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


type alias Model =
    RemoteData (Graphql.Http.Error Response) Response


type alias Flags =
    ()


init : String -> ( Model, Cmd Msg )
init api =
    ( RemoteData.Loading, makeRequest api )



-- UPDATE


type Msg
    = GotResponse Model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResponse response ->
            ( response, Cmd.none )



-- VIEW


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

viewUser: UserLookup -> Html msg 
viewUser userLookup =
    tr []
        [ th [] [ text "¯\\_(ツ)_/¯" ]
        , th [] [ text userLookup.nickname ]
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
