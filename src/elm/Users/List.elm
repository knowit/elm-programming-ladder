module Users.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Models exposing (User)
import RemoteData exposing (RemoteData(..), WebData)


view : WebData (List User) -> Html Msg
view response =
    div []
        [ nav
        , maybeList response
        ]


maybeList : WebData (List User) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success users ->
            list users

        RemoteData.Failure error ->
            text (toString error)

nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Users" ] ]


list : List User -> Html Msg
list users =
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Level" ]
                    , th [] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map userRow users)
            ]
        ]


userRow : User -> Html Msg
userRow user =
    tr []
        [ td [] [ text (toString user.id) ]
        , td [] [ text user.name ]
        , td [] [ text (toString user.level) ]
        , td []
            []
        ]
