-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphcool.Mutation exposing (AddToChallengeSolutionsRequiredArguments, AddToUserSolutionsRequiredArguments, AuthenticateUserRequiredArguments, CheckAnswerRequiredArguments, CreateChallengeOptionalArguments, CreateChallengeRequiredArguments, CreateSolutionOptionalArguments, CreateSolutionRequiredArguments, CreateUserOptionalArguments, DeleteChallengeRequiredArguments, DeleteSolutionRequiredArguments, DeleteUserRequiredArguments, InvokeFunctionRequiredArguments, UpdateChallengeOptionalArguments, UpdateChallengeRequiredArguments, UpdateOrCreateChallengeRequiredArguments, UpdateOrCreateSolutionRequiredArguments, UpdateOrCreateUserRequiredArguments, UpdateSolutionOptionalArguments, UpdateSolutionRequiredArguments, UpdateUserOptionalArguments, UpdateUserRequiredArguments, addToChallengeSolutions, addToUserSolutions, authenticateUser, checkAnswer, createChallenge, createSolution, createUser, deleteChallenge, deleteSolution, deleteUser, invokeFunction, updateChallenge, updateOrCreateChallenge, updateOrCreateSolution, updateOrCreateUser, updateSolution, updateUser)

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
import Json.Decode as Decode exposing (Decoder)


type alias CreateChallengeOptionalArguments =
    { activeFrom : OptionalArgument Graphcool.ScalarCodecs.DateTime
    , activeTo : OptionalArgument Graphcool.ScalarCodecs.DateTime
    , discussionUrl : OptionalArgument String
    , notes : OptionalArgument String
    , published : OptionalArgument Bool
    , solutionsIds : OptionalArgument (List Graphcool.ScalarCodecs.Id)
    , solutions : OptionalArgument (List Graphcool.InputObject.ChallengesolutionsSolution)
    }


type alias CreateChallengeRequiredArguments =
    { answer : String
    , markdown : String
    , markup : String
    , title : String
    }


createChallenge : (CreateChallengeOptionalArguments -> CreateChallengeOptionalArguments) -> CreateChallengeRequiredArguments -> SelectionSet decodesTo Graphcool.Object.Challenge -> SelectionSet (Maybe decodesTo) RootMutation
createChallenge fillInOptionals requiredArgs object_ =
    let
        filledInOptionals =
            fillInOptionals { activeFrom = Absent, activeTo = Absent, discussionUrl = Absent, notes = Absent, published = Absent, solutionsIds = Absent, solutions = Absent }

        optionalArgs =
            [ Argument.optional "activeFrom" filledInOptionals.activeFrom (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecDateTime), Argument.optional "activeTo" filledInOptionals.activeTo (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecDateTime), Argument.optional "discussionUrl" filledInOptionals.discussionUrl Encode.string, Argument.optional "notes" filledInOptionals.notes Encode.string, Argument.optional "published" filledInOptionals.published Encode.bool, Argument.optional "solutionsIds" filledInOptionals.solutionsIds ((Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId) |> Encode.list), Argument.optional "solutions" filledInOptionals.solutions (Graphcool.InputObject.encodeChallengesolutionsSolution |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "createChallenge" (optionalArgs ++ [ Argument.required "answer" requiredArgs.answer Encode.string, Argument.required "markdown" requiredArgs.markdown Encode.string, Argument.required "markup" requiredArgs.markup Encode.string, Argument.required "title" requiredArgs.title Encode.string ]) object_ (identity >> Decode.nullable)


type alias CreateSolutionOptionalArguments =
    { attempts : OptionalArgument Int
    , challengeId : OptionalArgument Graphcool.ScalarCodecs.Id
    , challenge : OptionalArgument Graphcool.InputObject.SolutionchallengeChallenge
    , userId : OptionalArgument Graphcool.ScalarCodecs.Id
    , user : OptionalArgument Graphcool.InputObject.SolutionuserUser
    }


type alias CreateSolutionRequiredArguments =
    { solved : Bool }


createSolution : (CreateSolutionOptionalArguments -> CreateSolutionOptionalArguments) -> CreateSolutionRequiredArguments -> SelectionSet decodesTo Graphcool.Object.Solution -> SelectionSet (Maybe decodesTo) RootMutation
createSolution fillInOptionals requiredArgs object_ =
    let
        filledInOptionals =
            fillInOptionals { attempts = Absent, challengeId = Absent, challenge = Absent, userId = Absent, user = Absent }

        optionalArgs =
            [ Argument.optional "attempts" filledInOptionals.attempts Encode.int, Argument.optional "challengeId" filledInOptionals.challengeId (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId), Argument.optional "challenge" filledInOptionals.challenge Graphcool.InputObject.encodeSolutionchallengeChallenge, Argument.optional "userId" filledInOptionals.userId (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId), Argument.optional "user" filledInOptionals.user Graphcool.InputObject.encodeSolutionuserUser ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "createSolution" (optionalArgs ++ [ Argument.required "solved" requiredArgs.solved Encode.bool ]) object_ (identity >> Decode.nullable)


type alias UpdateChallengeOptionalArguments =
    { activeFrom : OptionalArgument Graphcool.ScalarCodecs.DateTime
    , activeTo : OptionalArgument Graphcool.ScalarCodecs.DateTime
    , answer : OptionalArgument String
    , discussionUrl : OptionalArgument String
    , markdown : OptionalArgument String
    , markup : OptionalArgument String
    , notes : OptionalArgument String
    , published : OptionalArgument Bool
    , title : OptionalArgument String
    , solutionsIds : OptionalArgument (List Graphcool.ScalarCodecs.Id)
    , solutions : OptionalArgument (List Graphcool.InputObject.ChallengesolutionsSolution)
    }


type alias UpdateChallengeRequiredArguments =
    { id : Graphcool.ScalarCodecs.Id }


updateChallenge : (UpdateChallengeOptionalArguments -> UpdateChallengeOptionalArguments) -> UpdateChallengeRequiredArguments -> SelectionSet decodesTo Graphcool.Object.Challenge -> SelectionSet (Maybe decodesTo) RootMutation
updateChallenge fillInOptionals requiredArgs object_ =
    let
        filledInOptionals =
            fillInOptionals { activeFrom = Absent, activeTo = Absent, answer = Absent, discussionUrl = Absent, markdown = Absent, markup = Absent, notes = Absent, published = Absent, title = Absent, solutionsIds = Absent, solutions = Absent }

        optionalArgs =
            [ Argument.optional "activeFrom" filledInOptionals.activeFrom (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecDateTime), Argument.optional "activeTo" filledInOptionals.activeTo (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecDateTime), Argument.optional "answer" filledInOptionals.answer Encode.string, Argument.optional "discussionUrl" filledInOptionals.discussionUrl Encode.string, Argument.optional "markdown" filledInOptionals.markdown Encode.string, Argument.optional "markup" filledInOptionals.markup Encode.string, Argument.optional "notes" filledInOptionals.notes Encode.string, Argument.optional "published" filledInOptionals.published Encode.bool, Argument.optional "title" filledInOptionals.title Encode.string, Argument.optional "solutionsIds" filledInOptionals.solutionsIds ((Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId) |> Encode.list), Argument.optional "solutions" filledInOptionals.solutions (Graphcool.InputObject.encodeChallengesolutionsSolution |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "updateChallenge" (optionalArgs ++ [ Argument.required "id" requiredArgs.id (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId) ]) object_ (identity >> Decode.nullable)


type alias UpdateSolutionOptionalArguments =
    { attempts : OptionalArgument Int
    , solved : OptionalArgument Bool
    , challengeId : OptionalArgument Graphcool.ScalarCodecs.Id
    , challenge : OptionalArgument Graphcool.InputObject.SolutionchallengeChallenge
    , userId : OptionalArgument Graphcool.ScalarCodecs.Id
    , user : OptionalArgument Graphcool.InputObject.SolutionuserUser
    }


type alias UpdateSolutionRequiredArguments =
    { id : Graphcool.ScalarCodecs.Id }


updateSolution : (UpdateSolutionOptionalArguments -> UpdateSolutionOptionalArguments) -> UpdateSolutionRequiredArguments -> SelectionSet decodesTo Graphcool.Object.Solution -> SelectionSet (Maybe decodesTo) RootMutation
updateSolution fillInOptionals requiredArgs object_ =
    let
        filledInOptionals =
            fillInOptionals { attempts = Absent, solved = Absent, challengeId = Absent, challenge = Absent, userId = Absent, user = Absent }

        optionalArgs =
            [ Argument.optional "attempts" filledInOptionals.attempts Encode.int, Argument.optional "solved" filledInOptionals.solved Encode.bool, Argument.optional "challengeId" filledInOptionals.challengeId (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId), Argument.optional "challenge" filledInOptionals.challenge Graphcool.InputObject.encodeSolutionchallengeChallenge, Argument.optional "userId" filledInOptionals.userId (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId), Argument.optional "user" filledInOptionals.user Graphcool.InputObject.encodeSolutionuserUser ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "updateSolution" (optionalArgs ++ [ Argument.required "id" requiredArgs.id (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId) ]) object_ (identity >> Decode.nullable)


type alias UpdateUserOptionalArguments =
    { auth0UserId : OptionalArgument String
    , email : OptionalArgument String
    , role : OptionalArgument Graphcool.Enum.UserRole.UserRole
    , solutionsIds : OptionalArgument (List Graphcool.ScalarCodecs.Id)
    , solutions : OptionalArgument (List Graphcool.InputObject.UsersolutionsSolution)
    }


type alias UpdateUserRequiredArguments =
    { id : Graphcool.ScalarCodecs.Id }


updateUser : (UpdateUserOptionalArguments -> UpdateUserOptionalArguments) -> UpdateUserRequiredArguments -> SelectionSet decodesTo Graphcool.Object.User -> SelectionSet (Maybe decodesTo) RootMutation
updateUser fillInOptionals requiredArgs object_ =
    let
        filledInOptionals =
            fillInOptionals { auth0UserId = Absent, email = Absent, role = Absent, solutionsIds = Absent, solutions = Absent }

        optionalArgs =
            [ Argument.optional "auth0UserId" filledInOptionals.auth0UserId Encode.string, Argument.optional "email" filledInOptionals.email Encode.string, Argument.optional "role" filledInOptionals.role (Encode.enum Graphcool.Enum.UserRole.toString), Argument.optional "solutionsIds" filledInOptionals.solutionsIds ((Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId) |> Encode.list), Argument.optional "solutions" filledInOptionals.solutions (Graphcool.InputObject.encodeUsersolutionsSolution |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "updateUser" (optionalArgs ++ [ Argument.required "id" requiredArgs.id (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId) ]) object_ (identity >> Decode.nullable)


type alias UpdateOrCreateChallengeRequiredArguments =
    { update : Graphcool.InputObject.UpdateChallenge
    , create : Graphcool.InputObject.CreateChallenge
    }


updateOrCreateChallenge : UpdateOrCreateChallengeRequiredArguments -> SelectionSet decodesTo Graphcool.Object.Challenge -> SelectionSet (Maybe decodesTo) RootMutation
updateOrCreateChallenge requiredArgs object_ =
    Object.selectionForCompositeField "updateOrCreateChallenge" [ Argument.required "update" requiredArgs.update Graphcool.InputObject.encodeUpdateChallenge, Argument.required "create" requiredArgs.create Graphcool.InputObject.encodeCreateChallenge ] object_ (identity >> Decode.nullable)


type alias UpdateOrCreateSolutionRequiredArguments =
    { update : Graphcool.InputObject.UpdateSolution
    , create : Graphcool.InputObject.CreateSolution
    }


updateOrCreateSolution : UpdateOrCreateSolutionRequiredArguments -> SelectionSet decodesTo Graphcool.Object.Solution -> SelectionSet (Maybe decodesTo) RootMutation
updateOrCreateSolution requiredArgs object_ =
    Object.selectionForCompositeField "updateOrCreateSolution" [ Argument.required "update" requiredArgs.update Graphcool.InputObject.encodeUpdateSolution, Argument.required "create" requiredArgs.create Graphcool.InputObject.encodeCreateSolution ] object_ (identity >> Decode.nullable)


type alias UpdateOrCreateUserRequiredArguments =
    { update : Graphcool.InputObject.UpdateUser
    , create : Graphcool.InputObject.CreateUser
    }


updateOrCreateUser : UpdateOrCreateUserRequiredArguments -> SelectionSet decodesTo Graphcool.Object.User -> SelectionSet (Maybe decodesTo) RootMutation
updateOrCreateUser requiredArgs object_ =
    Object.selectionForCompositeField "updateOrCreateUser" [ Argument.required "update" requiredArgs.update Graphcool.InputObject.encodeUpdateUser, Argument.required "create" requiredArgs.create Graphcool.InputObject.encodeCreateUser ] object_ (identity >> Decode.nullable)


type alias DeleteChallengeRequiredArguments =
    { id : Graphcool.ScalarCodecs.Id }


deleteChallenge : DeleteChallengeRequiredArguments -> SelectionSet decodesTo Graphcool.Object.Challenge -> SelectionSet (Maybe decodesTo) RootMutation
deleteChallenge requiredArgs object_ =
    Object.selectionForCompositeField "deleteChallenge" [ Argument.required "id" requiredArgs.id (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId) ] object_ (identity >> Decode.nullable)


type alias DeleteSolutionRequiredArguments =
    { id : Graphcool.ScalarCodecs.Id }


deleteSolution : DeleteSolutionRequiredArguments -> SelectionSet decodesTo Graphcool.Object.Solution -> SelectionSet (Maybe decodesTo) RootMutation
deleteSolution requiredArgs object_ =
    Object.selectionForCompositeField "deleteSolution" [ Argument.required "id" requiredArgs.id (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId) ] object_ (identity >> Decode.nullable)


type alias DeleteUserRequiredArguments =
    { id : Graphcool.ScalarCodecs.Id }


deleteUser : DeleteUserRequiredArguments -> SelectionSet decodesTo Graphcool.Object.User -> SelectionSet (Maybe decodesTo) RootMutation
deleteUser requiredArgs object_ =
    Object.selectionForCompositeField "deleteUser" [ Argument.required "id" requiredArgs.id (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId) ] object_ (identity >> Decode.nullable)


type alias AddToChallengeSolutionsRequiredArguments =
    { solutionsSolutionId : Graphcool.ScalarCodecs.Id
    , challengeChallengeId : Graphcool.ScalarCodecs.Id
    }


addToChallengeSolutions : AddToChallengeSolutionsRequiredArguments -> SelectionSet decodesTo Graphcool.Object.AddToChallengeSolutionsPayload -> SelectionSet (Maybe decodesTo) RootMutation
addToChallengeSolutions requiredArgs object_ =
    Object.selectionForCompositeField "addToChallengeSolutions" [ Argument.required "solutionsSolutionId" requiredArgs.solutionsSolutionId (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId), Argument.required "challengeChallengeId" requiredArgs.challengeChallengeId (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId) ] object_ (identity >> Decode.nullable)


type alias AddToUserSolutionsRequiredArguments =
    { solutionsSolutionId : Graphcool.ScalarCodecs.Id
    , userUserId : Graphcool.ScalarCodecs.Id
    }


addToUserSolutions : AddToUserSolutionsRequiredArguments -> SelectionSet decodesTo Graphcool.Object.AddToUserSolutionsPayload -> SelectionSet (Maybe decodesTo) RootMutation
addToUserSolutions requiredArgs object_ =
    Object.selectionForCompositeField "addToUserSolutions" [ Argument.required "solutionsSolutionId" requiredArgs.solutionsSolutionId (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId), Argument.required "userUserId" requiredArgs.userUserId (Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId) ] object_ (identity >> Decode.nullable)


type alias CreateUserOptionalArguments =
    { auth0UserId : OptionalArgument String
    , email : OptionalArgument String
    , role : OptionalArgument Graphcool.Enum.UserRole.UserRole
    , solutionsIds : OptionalArgument (List Graphcool.ScalarCodecs.Id)
    , solutions : OptionalArgument (List Graphcool.InputObject.UsersolutionsSolution)
    }


createUser : (CreateUserOptionalArguments -> CreateUserOptionalArguments) -> SelectionSet decodesTo Graphcool.Object.User -> SelectionSet (Maybe decodesTo) RootMutation
createUser fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { auth0UserId = Absent, email = Absent, role = Absent, solutionsIds = Absent, solutions = Absent }

        optionalArgs =
            [ Argument.optional "auth0UserId" filledInOptionals.auth0UserId Encode.string, Argument.optional "email" filledInOptionals.email Encode.string, Argument.optional "role" filledInOptionals.role (Encode.enum Graphcool.Enum.UserRole.toString), Argument.optional "solutionsIds" filledInOptionals.solutionsIds ((Graphcool.ScalarCodecs.codecs |> Graphcool.Scalar.unwrapEncoder .codecId) |> Encode.list), Argument.optional "solutions" filledInOptionals.solutions (Graphcool.InputObject.encodeUsersolutionsSolution |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "createUser" optionalArgs object_ (identity >> Decode.nullable)


type alias AuthenticateUserRequiredArguments =
    { accessToken : String }


{-| authenticate
-}
authenticateUser : AuthenticateUserRequiredArguments -> SelectionSet decodesTo Graphcool.Object.AuthenticateUserPayload -> SelectionSet decodesTo RootMutation
authenticateUser requiredArgs object_ =
    Object.selectionForCompositeField "authenticateUser" [ Argument.required "accessToken" requiredArgs.accessToken Encode.string ] object_ identity


type alias CheckAnswerRequiredArguments =
    { challengeId : String
    , answer : String
    }


{-| checkAnswer
-}
checkAnswer : CheckAnswerRequiredArguments -> SelectionSet decodesTo Graphcool.Object.CheckAnswerPayload -> SelectionSet decodesTo RootMutation
checkAnswer requiredArgs object_ =
    Object.selectionForCompositeField "checkAnswer" [ Argument.required "challengeId" requiredArgs.challengeId Encode.string, Argument.required "answer" requiredArgs.answer Encode.string ] object_ identity


type alias InvokeFunctionRequiredArguments =
    { input : Graphcool.InputObject.InvokeFunctionInput }


invokeFunction : InvokeFunctionRequiredArguments -> SelectionSet decodesTo Graphcool.Object.InvokeFunctionPayload -> SelectionSet (Maybe decodesTo) RootMutation
invokeFunction requiredArgs object_ =
    Object.selectionForCompositeField "invokeFunction" [ Argument.required "input" requiredArgs.input Graphcool.InputObject.encodeInvokeFunctionInput ] object_ (identity >> Decode.nullable)
