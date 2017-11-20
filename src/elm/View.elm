module View exposing (..)

import Models exposing (Model)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Updates exposing (update, Msg)


view : Model -> Html Msg
view model =
    div []
        [ -- inline CSS (literal)
          div [ class "navigation" ]
            [ -- inline CSS (literal)
              span [] [ text "Nav" ]
            ]
        , div [ class "container" ]
            [ -- inline CSS (literal)
              span [] [ text "container" ]
            ]
        ]
