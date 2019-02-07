module Main exposing (Model, Msg(..), init, main, subscriptions, update, view)

import Asset
import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Page.About as About
import Page.Home as Home
import Page.Stats as Stats
import Url
import Url.Parser as Parser exposing ((</>), Parser, int, map, oneOf, s, string, top)



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
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key url NotFound, Cmd.none )


type Route
    = About
    | Challenge Int
    | Challenges
    | Home
    | Login
    | Register
    | Stats
    | NotFound


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map About (s "about")
        , map Challenge (s "challenge" </> int)
        , map Challenges (s "challenges")
        , map Home top
        , map Login (s "login")
        , map Register (s "register")
        , map Login (s "login")
        , map Stats (s "leaderboard")
        ]

fromUrl : Url.Url -> Route
fromUrl url =
    Maybe.withDefault NotFound (Parser.parse routeParser url)


-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | route = fromUrl url }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    let
        viewPage = 
            case model.route of
                Home ->
                    Home.viewHome
                About ->
                    About.viewAbout 
                NotFound ->
                    About.viewAbout 
                Challenge _ ->
                    About.viewAbout 
                Challenges ->
                    About.viewAbout 
                Login ->
                    About.viewAbout 
                Register ->
                    About.viewAbout 
                Stats ->
                    Stats.viewStats  
    in
    
    { title = "Kodekalender"
    , body =
        [ div [ class "navbar-top" ]
            [ ul [ class "nav-link-list" ]
                [ li [ class "nav-link-image" ] [ a [ href "/home" ] [ img [ Asset.src Asset.icon, width 50, height 50 ] [ text "Hjem" ] ] ]
                , li [ class "nav-link" ] [ a [ href "/challenges" ] [ text "Luker" ] ]
                , li [ class "nav-link" ] [ a [ href "/leaderboard" ] [ text "Ledertavle" ] ]
                , li [ class "nav-link" ] [ a [ href "/about" ] [ text "Om" ] ]
                , li [ class "nav-link-right" ] [ a [ href "/login" ] [ text "Logg Inn" ] ]
                ]
            ]
        , viewPage
        , div [ class "footer" ]
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
        ]
    }
