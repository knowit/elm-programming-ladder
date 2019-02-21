-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphcool.Object.LoggedInUserPayload exposing (id, role, userId)

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


id : SelectionSet Graphcool.ScalarCodecs.Id Graphcool.Object.LoggedInUserPayload
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecId |> .decoder)


role : SelectionSet (Maybe String) Graphcool.Object.LoggedInUserPayload
role =
    Object.selectionForField "(Maybe String)" "role" [] (Decode.string |> Decode.nullable)


userId : SelectionSet (Maybe String) Graphcool.Object.LoggedInUserPayload
userId =
    Object.selectionForField "(Maybe String)" "userId" [] (Decode.string |> Decode.nullable)
