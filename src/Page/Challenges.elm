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



-- REQUEST


type alias Response =
    List ChallengeLookup


query : SelectionSet Response RootQuery
query =
    Query.allChallenges (\optionals -> { optionals | orderBy = Present ChallengeOrderBy.ActiveFrom_ASC }) challenge


type alias ChallengeLookup =
    { id : Graphcool.ScalarCodecs.Id
    , activeFrom : Maybe Graphcool.ScalarCodecs.DateTime
    }


challenge : SelectionSet ChallengeLookup Graphcool.Object.Challenge
challenge =
    SelectionSet.map2 ChallengeLookup
        Challenge.id
        Challenge.activeFrom


makeRequest : Cmd Msg
makeRequest =
    query
        |> Graphql.Http.queryRequest "https://api.graph.cool/simple/v1/cjtsh660h0fxg0189of111ui9"
        |> Graphql.Http.send (RemoteData.fromResult >> GotResponse)



-- MODEL


type alias Model =
    RemoteData (Graphql.Http.Error Response) Response


type alias Flags =
    ()


init : ( Model, Cmd Msg )
init =
    ( RemoteData.Loading, makeRequest )



-- UPDATE


type Msg
    = GotResponse Model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResponse response ->
            ( response, Cmd.none )



-- VIEW


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