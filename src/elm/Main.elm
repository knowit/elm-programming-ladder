module Main exposing (..)

import Commands exposing (fetchUsers)
import Html exposing (..)
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Msgs exposing (Msg)
import Routing
import Navigation exposing (Location)
-- INIT


init : Location -> ( Model, Cmd Msg )
init location =
    let
      currentRoute =
          Routing.parseLocation location
    in
        ( initialModel currentRoute, fetchUsers )



-- APP
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
