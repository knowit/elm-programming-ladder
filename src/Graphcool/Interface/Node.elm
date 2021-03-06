-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphcool.Interface.Node exposing (Fragments, fragments, id, maybeFragments)

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
import Graphql.SelectionSet exposing (FragmentSelectionSet(..), SelectionSet(..))
import Json.Decode as Decode


type alias Fragments decodesTo =
    { onChallenge : SelectionSet decodesTo Graphcool.Object.Challenge
    , onSolution : SelectionSet decodesTo Graphcool.Object.Solution
    , onUser : SelectionSet decodesTo Graphcool.Object.User
    }


{-| Build an exhaustive selection of type-specific fragments.
-}
fragments :
    Fragments decodesTo
    -> SelectionSet decodesTo Graphcool.Interface.Node
fragments selections =
    Object.exhuastiveFragmentSelection
        [ Object.buildFragment "Challenge" selections.onChallenge
        , Object.buildFragment "Solution" selections.onSolution
        , Object.buildFragment "User" selections.onUser
        ]


{-| Can be used to create a non-exhuastive set of fragments by using the record
update syntax to add `SelectionSet`s for the types you want to handle.
-}
maybeFragments : Fragments (Maybe decodesTo)
maybeFragments =
    { onChallenge = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onSolution = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onUser = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    }


{-| The id of the object.
-}
id : SelectionSet Graphcool.ScalarCodecs.Id Graphcool.Interface.Node
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapCodecs |> .codecId |> .decoder)
