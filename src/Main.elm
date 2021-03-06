module Main exposing (Model, Msg(..), init, main, subscriptions, update, view)

import Asset
import Browser
import Browser.Navigation as Nav
import Debug
import Html exposing (..)
import Html.Attributes exposing (..)
import Page.About as About
import Page.Home as Home
import Page.Stats as Stats
import Page.Challenges as Challenges
import Page.Problem as Problem
import Url
import Url.Parser as Parser exposing ((</>), Parser, int, map, oneOf, s, top)



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , route : Route
    , page : Page
    , api : String
    }

{- Expand when adding more pages -}
type Page
    = PageStats Stats.Model
    | PageHome
    | PageAbout
    | PageChallenges Challenges.Model
    | ErrorPage


type Route
    = Home
    | About
    | Challenge Int
    | Challenges
    | Login
    | Register
    | Stats
    | NotFound

{- Initializes the program and loads the current page -}
init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        model =
            { key = key
            , url = url
            , route = Home
            , page = PageHome
            , api = "" -- Enter GraphQL api url here !!
            }
    in
    ( model, Cmd.none )
        |> loadCurrentPage


parser : Parser (Route -> a) a
parser =
    oneOf
        [ map Home top
        , map About (s "about")
        , map Challenge (s "challenge" </> int)
        , map Challenges (s "challenges")
        , map Login (s "login")
        , map Register (s "register")
        , map Stats (s "leaderboard")
        ]


urlToRoute : Url.Url -> Route
urlToRoute url =
    Maybe.withDefault NotFound (Parser.parse parser url)

{- 
    Loads the current page, and initializes models where needed. 
    Unsupported routes currently leads to an ErrorPage, 
    which needs to be updated when making these pages
-}
loadCurrentPage : ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
loadCurrentPage ( model, cmd ) =
    let
        ( page, newCmd ) =
            case model.route of
                Home ->
                    ( PageHome, Cmd.none )

                About ->
                    ( PageAbout, Cmd.none )

                Challenge _ ->
                    ( ErrorPage, Cmd.none )

                Challenges ->
                    let 
                        ( pageModel, pageCmd ) =
                            Challenges.init model.api
                    in
                    ( PageChallenges pageModel, Cmd.map ChallengesMsg pageCmd )
                Login ->
                    ( ErrorPage, Cmd.none )

                Register ->
                    ( ErrorPage, Cmd.none )

                NotFound ->
                    ( ErrorPage, Cmd.none )

                Stats ->
                    let
                        ( pageModel, pageCmd ) =
                            Stats.init model.api
                    in
                    ( PageStats pageModel, Cmd.map StatsMsg pageCmd )
    in
    ( { model | page = page }, Cmd.batch [ cmd, newCmd ] )



-- UPDATE

{- Needs to be expanded when making new dynamic pages with their own Msg -}
type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | StatsMsg Stats.Msg
    | ChallengesMsg Challenges.Msg

{- Needs to be expanded when making new dynamic pages with their own Msg and Update -}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model.page ) of
        ( LinkClicked urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        ( UrlChanged url, _ ) ->
            ( { model
                | url = url
                , route = urlToRoute url
              }
            , Cmd.none
            )
                |> loadCurrentPage

        ( StatsMsg subMsg, PageStats pageModel ) ->
            let
                ( newPageModel, newCmd ) =
                    Stats.update subMsg pageModel
            in
            ( { model | page = PageStats newPageModel }
            , Cmd.map StatsMsg newCmd
            )

        ( StatsMsg subMsg, _ ) ->
            ( model, Cmd.none )

        ( ChallengesMsg subMsg, PageChallenges pageModel ) ->
            let
                ( newPageModel, newCmd ) =
                    Challenges.update subMsg pageModel
            in
            ( { model | page = PageChallenges newPageModel }
            , Cmd.map ChallengesMsg newCmd
            )

        ( ChallengesMsg subMsg, _ ) ->
            ( model, Cmd.none )
        



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW

{- Displays the current page. Needs to be expanded when creating more pages -}
view : Model -> Browser.Document Msg
view model =
    let
        viewPage =
            case model.page of
                PageHome ->
                    Home.viewHome

                PageAbout ->
                    About.viewAbout

                PageStats pageModel ->
                    Stats.viewStats pageModel
                        |> Html.map StatsMsg
                
                PageChallenges pageModel ->
                    Challenges.viewChallenges pageModel
                        |> Html.map ChallengesMsg
                
                ErrorPage ->
                    Problem.notFound
    in
    { title = "Kodekalender"
    , body =
        [ navbar
        , viewPage
        , footer
        ]
    }

navbar : Html msg 
navbar = 
    div [ class "navbar-top" ]
        [ ul [ class "nav-link-list" ]
            [ li [ class "nav-link-image" ] [ a [ href "/" ] [ img [ Asset.src Asset.icon, width 50, height 50 ] [ text "Hjem" ] ] ]
            , li [ class "nav-link" ] [ a [ href "/challenges" ] [ text "Luker" ] ]
            , li [ class "nav-link" ] [ a [ href "/leaderboard" ] [ text "Ledertavle" ] ]
            , li [ class "nav-link" ] [ a [ href "/about" ] [ text "Om" ] ]
            , li [ class "nav-link-right" ] [ a [ href "/login" ] [ text "Logg Inn" ] ]
            ]
        ]

footer : Html msg 
footer = 
    div [ class "footer" ]
            [ div [ class "footer-content" ]
                [ img [ class "footer-logo", Asset.src Asset.logo, width 130, height 30 ] [ text "Knowit" ]
                , ul [ class "footer-social-list" ]
                    [ li [ class "footer-social" ] [ a [ href "https://www.facebook.com/knowitsolution" ] [ i [ class "icon-social fab fa-facebook circle" ] [] ] ]
                    , li [ class "footer-social" ] [ a [ href "https://twitter.com/knowitnorge" ] [ i [ class "icon-social fab fa-twitter circle" ] [] ] ]
                    , li [ class "footer-social" ] [ a [ href "https://knowitlabs.no/" ] [ i [ class "icon-social fab fa-medium circle" ] [] ] ]
                    , li [ class "footer-social" ] [ a [ href "https://github.com/knowit/kodekalender" ] [ i [ class "icon-social fab fa-github circle" ] [] ] ]
                    ]
                ]
            ]