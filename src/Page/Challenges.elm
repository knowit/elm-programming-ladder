module Page.Challenges exposing (Model, Msg, init, update, viewChallenges)

import Graphcool.Enum.ChallengeOrderBy as ChallengeOrderBy
import Graphcool.InputObject
import Graphcool.Interface
import Graphcool.Object
import Graphcool.Object.Challenge as Challenge
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
    Collects and displays the challenges
-}

-- REQUEST

{- The response is a list of challenges -}
type alias Response =
    List ChallengeLookup

{- Creates the query -}
query : SelectionSet Response RootQuery
query =
    Query.allChallenges (\optionals -> { optionals | orderBy = Present ChallengeOrderBy.ActiveFrom_ASC }) challenge -- Change to take in filter as well, and be based on which user is logged in

{- The type the response is decoded to. Expand to collect more fields. Some might need authentication. Called ChallengeLookup to avoid confusion -}
type alias ChallengeLookup =
    { id : Graphcool.ScalarCodecs.Id
    , activeFrom : Maybe Graphcool.ScalarCodecs.DateTime
    }

{- Expand to collect more fields. Some might need authentication. -}
challenge : SelectionSet ChallengeLookup Graphcool.Object.Challenge
challenge =
    SelectionSet.map2 ChallengeLookup
        Challenge.id
        Challenge.activeFrom


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
viewChallenges : Model -> Html msg
viewChallenges model =
    let
        content = 
            case model of
                RemoteData.Success users ->
                    viewChallengesList users
                RemoteData.Failure error ->
                    text ("Error: " ++ Debug.toString error)
                _ ->
                    text "Loading..."
                
    in
    div [ class "content-main" ]
        [ content 
        ]

viewChallengesList : List ChallengeLookup -> Html msg 
viewChallengesList challenges = 
    div [ class "doors-container" ]
        (List.indexedMap viewChallenge challenges)
         

viewChallenge : Int -> ChallengeLookup -> Html msg
viewChallenge index challengeLookup = 
    div [ class "door-style" ]
        [ text (String.fromInt (index + 1)) 
        ]