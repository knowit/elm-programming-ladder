module Page.Challenges exposing (viewChallenges, Model, Msg, init, update)

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
import Graphcool.Object.Challenge as Challenge
import Graphcool.Scalar
import Graphcool.InputObject
import Graphcool.Enum.ChallengeOrderBy as ChallengeOrderBy

-- REQUEST

type alias Response = 
    List ChallengeLookup

query : SelectionSet Response RootQuery
query =
    Query.allChallenges (\optionals -> { optionals | orderBy = Present ChallengeOrderBy.ActiveFrom_ASC }) challenge



type alias ChallengeLookup = 
    { id : Graphcool.ScalarCodecs.Id
    , activeFrom: Maybe Graphcool.ScalarCodecs.DateTime
    }

challenge : SelectionSet ChallengeLookup Graphcool.Object.Challenge
challenge = 
    SelectionSet.map2 ChallengeLookup
        Challenge.id
        Challenge.activeFrom

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

viewChallenges : Model -> Html msg
viewChallenges model = 
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
    
