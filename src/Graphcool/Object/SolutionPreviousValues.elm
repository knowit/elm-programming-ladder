-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphcool.Object.SolutionPreviousValues exposing (attempts, createdAt, id, solved, updatedAt)

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


attempts : SelectionSet (Maybe Int) Graphcool.Object.SolutionPreviousValues
attempts =
    Object.selectionForField "(Maybe Int)" "attempts" [] (Decode.int |> Decode.nullable)


createdAt : SelectionSet Graphcool.ScalarCodecs.DateTime Graphcool.Object.SolutionPreviousValues
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


id : SelectionSet Graphcool.ScalarCodecs.Id Graphcool.Object.SolutionPreviousValues
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecId |> .decoder)


solved : SelectionSet Bool Graphcool.Object.SolutionPreviousValues
solved =
    Object.selectionForField "Bool" "solved" [] Decode.bool


updatedAt : SelectionSet Graphcool.ScalarCodecs.DateTime Graphcool.Object.SolutionPreviousValues
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)