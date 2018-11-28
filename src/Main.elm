module Main exposing (Model, Msg(..), init, main, subscriptions, update, view, viewLink)

import Asset
import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url



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
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key url, Cmd.none )



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
            ( { model | url = url }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Kodekalender"
    , body =
        [ div [ class "navbar-top" ]
            [ text "top navbar"
            , ul [ class "nav-link-list" ]
                [ li [ class "nav-link" ] [ a [ href "/home" ] [ img [ Asset.src Asset.icon, width 50, height 50 ] [ text "Hjem" ] ] ]
                , li [ class "nav-link" ] [ a [ href "/home" ] [ text "Luker" ] ]
                , li [ class "nav-link" ] [ a [ href "/profile" ] [ text "Ledertavle" ] ]
                , li [ class "nav-link" ] [ a [ href "/reviews/the-century-of-the-self" ] [ text "Om" ] ]
                , li [ class "nav-link" ] [ a [ href "/reviews/public-opinion" ] [ text "Logg Inn" ] ]
                ]
            ]
        , div [ class "content-main" ] [ text "content div" ]
        , div [ class "footer" ] [ text "Yes, this is footer" ]
        ]
    }


viewLink : String -> Html msg
viewLink path =
    li [] [ a [ href path ] [ text path ] ]
