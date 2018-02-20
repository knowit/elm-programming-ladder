module Users.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Msgs exposing (Msg)
import Models exposing (User)


view : User -> Html Msg
view model =
    div []
        [ nav model
        , form model
        ]


nav : User -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
        []


form : User -> Html Msg
form user =
    div [ class "m3" ]
        [ h1 [] [ text user.name ]
        , formLevel user
        ]


formLevel : User -> Html Msg
formLevel user =
    div
        [ class "clearfix py1"
        ]
        [ div [ class "col col-5" ] [ text "Level" ]
        , div [ class "col col-7" ]
            [ span [ class "h2 bold" ] [ text (toString user.level) ]
            , btnLevelDecrease user
            , btnLevelIncrease user
            ]
        ]


btnLevelDecrease : User -> Html Msg
btnLevelDecrease player =
    a [ class "btn ml1 h1" ]
        [ i [ class "fa fa-minus-circle" ] [] ]


btnLevelIncrease : User -> Html Msg
btnLevelIncrease user =
    a [ class "btn ml1 h1" ]
        [ i [ class "fa fa-plus-circle" ] [] ]
