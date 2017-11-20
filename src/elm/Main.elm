module Main exposing (..)

import Html exposing (..)
import Components.Hello exposing (hello)
import Models exposing (Model, initialModel)
import Updates exposing (update, Msg)
import View exposing (view)


-- INIT


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- APP


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = initialModel, view = view, update = update }
