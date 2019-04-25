-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphcool.Object.ChallengePreviousValues exposing (activeFrom, activeTo, answer, createdAt, discussionUrl, id, markdown, markup, published, title, updatedAt)

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


activeFrom : SelectionSet (Maybe Graphcool.ScalarCodecs.DateTime) Graphcool.Object.ChallengePreviousValues
activeFrom =
    Object.selectionForField "(Maybe ScalarCodecs.DateTime)" "activeFrom" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecDateTime |> .decoder |> Decode.nullable)


activeTo : SelectionSet (Maybe Graphcool.ScalarCodecs.DateTime) Graphcool.Object.ChallengePreviousValues
activeTo =
    Object.selectionForField "(Maybe ScalarCodecs.DateTime)" "activeTo" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecDateTime |> .decoder |> Decode.nullable)


answer : SelectionSet String Graphcool.Object.ChallengePreviousValues
answer =
    Object.selectionForField "String" "answer" [] Decode.string


createdAt : SelectionSet Graphcool.ScalarCodecs.DateTime Graphcool.Object.ChallengePreviousValues
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


discussionUrl : SelectionSet (Maybe String) Graphcool.Object.ChallengePreviousValues
discussionUrl =
    Object.selectionForField "(Maybe String)" "discussionUrl" [] (Decode.string |> Decode.nullable)


id : SelectionSet Graphcool.ScalarCodecs.Id Graphcool.Object.ChallengePreviousValues
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecId |> .decoder)


markdown : SelectionSet String Graphcool.Object.ChallengePreviousValues
markdown =
    Object.selectionForField "String" "markdown" [] Decode.string


markup : SelectionSet String Graphcool.Object.ChallengePreviousValues
markup =
    Object.selectionForField "String" "markup" [] Decode.string


published : SelectionSet Bool Graphcool.Object.ChallengePreviousValues
published =
    Object.selectionForField "Bool" "published" [] Decode.bool


title : SelectionSet String Graphcool.Object.ChallengePreviousValues
title =
    Object.selectionForField "String" "title" [] Decode.string


updatedAt : SelectionSet Graphcool.ScalarCodecs.DateTime Graphcool.Object.ChallengePreviousValues
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)