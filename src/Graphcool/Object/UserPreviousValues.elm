-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphcool.Object.UserPreviousValues exposing (auth0UserId, createdAt, id, nickname, picture, role, updatedAt)

import Graphcool.Enum.UserRole
import Graphcool.InputObject
import Graphcool.Interface
import Graphcool.Object
import Graphcool.Scalar
import Graphcool.ScalarCodecs
import Graphcool.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


auth0UserId : SelectionSet String Graphcool.Object.UserPreviousValues
auth0UserId =
    Object.selectionForField "String" "auth0UserId" [] Decode.string


createdAt : SelectionSet Graphcool.ScalarCodecs.DateTime Graphcool.Object.UserPreviousValues
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


id : SelectionSet Graphcool.ScalarCodecs.Id Graphcool.Object.UserPreviousValues
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecId |> .decoder)


nickname : SelectionSet String Graphcool.Object.UserPreviousValues
nickname =
    Object.selectionForField "String" "nickname" [] Decode.string


picture : SelectionSet String Graphcool.Object.UserPreviousValues
picture =
    Object.selectionForField "String" "picture" [] Decode.string


role : SelectionSet Graphcool.Enum.UserRole.UserRole Graphcool.Object.UserPreviousValues
role =
    Object.selectionForField "Enum.UserRole.UserRole" "role" [] Graphcool.Enum.UserRole.decoder


updatedAt : SelectionSet Graphcool.ScalarCodecs.DateTime Graphcool.Object.UserPreviousValues
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)
