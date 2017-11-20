module Updates exposing (..)
import Models exposing (Model)

type Msg = NoOp 

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model
