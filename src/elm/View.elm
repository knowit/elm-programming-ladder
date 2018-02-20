module View exposing (..)

import Html exposing (Html, div, text)
import Models exposing (Model, UserId, Route(..))
import Msgs exposing (Msg(..))
import Users.Edit
import Users.List
import RemoteData exposing (RemoteData(..), WebData)


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        UsersRoute ->
            Users.List.view model.users

        UserRoute id ->
            userEditPage model id

        NotFoundRoute ->
            notFoundView


userEditPage : Model -> UserId -> Html Msg
userEditPage model userId =
    case model.users of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading ..."

        RemoteData.Success users ->
            let
                maybeUser =
                    users
                        |> List.filter (\user -> user.id == userId)
                        |> List.head
            in
                case maybeUser of
                    Just user ->
                        Users.Edit.view user

                    Nothing ->
                        notFoundView

        RemoteData.Failure err ->
            text (toString err)


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
