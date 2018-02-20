module Update exposing (..)

import Msgs exposing (Msg)
import Models exposing (Model)
import RemoteData exposing (RemoteData(..), WebData)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnFetchUsers response ->
            ( { model | users = response }, Cmd.none )
        _ ->
          ( { model | users = RemoteData.Loading }, Cmd.none )
