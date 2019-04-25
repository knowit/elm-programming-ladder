-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphcool.Object.AddToUserSolutionsPayload exposing (solutionsSolution, userUser)

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


userUser : SelectionSet decodesTo Graphcool.Object.User -> SelectionSet (Maybe decodesTo) Graphcool.Object.AddToUserSolutionsPayload
userUser object_ =
    Object.selectionForCompositeField "userUser" [] object_ (identity >> Decode.nullable)


solutionsSolution : SelectionSet decodesTo Graphcool.Object.Solution -> SelectionSet (Maybe decodesTo) Graphcool.Object.AddToUserSolutionsPayload
solutionsSolution object_ =
    Object.selectionForCompositeField "solutionsSolution" [] object_ (identity >> Decode.nullable)