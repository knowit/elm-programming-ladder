-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphcool.Enum.ChallengeOrderBy exposing (ChallengeOrderBy(..), decoder, list, toString)

import Json.Decode as Decode exposing (Decoder)


type ChallengeOrderBy
    = ActiveFrom_ASC
    | ActiveFrom_DESC
    | ActiveTo_ASC
    | ActiveTo_DESC
    | Answer_ASC
    | Answer_DESC
    | CreatedAt_ASC
    | CreatedAt_DESC
    | DiscussionUrl_ASC
    | DiscussionUrl_DESC
    | Id_ASC
    | Id_DESC
    | Markdown_ASC
    | Markdown_DESC
    | Markup_ASC
    | Markup_DESC
    | Notes_ASC
    | Notes_DESC
    | Published_ASC
    | Published_DESC
    | Title_ASC
    | Title_DESC
    | UpdatedAt_ASC
    | UpdatedAt_DESC


list : List ChallengeOrderBy
list =
    [ ActiveFrom_ASC, ActiveFrom_DESC, ActiveTo_ASC, ActiveTo_DESC, Answer_ASC, Answer_DESC, CreatedAt_ASC, CreatedAt_DESC, DiscussionUrl_ASC, DiscussionUrl_DESC, Id_ASC, Id_DESC, Markdown_ASC, Markdown_DESC, Markup_ASC, Markup_DESC, Notes_ASC, Notes_DESC, Published_ASC, Published_DESC, Title_ASC, Title_DESC, UpdatedAt_ASC, UpdatedAt_DESC ]


decoder : Decoder ChallengeOrderBy
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "activeFrom_ASC" ->
                        Decode.succeed ActiveFrom_ASC

                    "activeFrom_DESC" ->
                        Decode.succeed ActiveFrom_DESC

                    "activeTo_ASC" ->
                        Decode.succeed ActiveTo_ASC

                    "activeTo_DESC" ->
                        Decode.succeed ActiveTo_DESC

                    "answer_ASC" ->
                        Decode.succeed Answer_ASC

                    "answer_DESC" ->
                        Decode.succeed Answer_DESC

                    "createdAt_ASC" ->
                        Decode.succeed CreatedAt_ASC

                    "createdAt_DESC" ->
                        Decode.succeed CreatedAt_DESC

                    "discussionUrl_ASC" ->
                        Decode.succeed DiscussionUrl_ASC

                    "discussionUrl_DESC" ->
                        Decode.succeed DiscussionUrl_DESC

                    "id_ASC" ->
                        Decode.succeed Id_ASC

                    "id_DESC" ->
                        Decode.succeed Id_DESC

                    "markdown_ASC" ->
                        Decode.succeed Markdown_ASC

                    "markdown_DESC" ->
                        Decode.succeed Markdown_DESC

                    "markup_ASC" ->
                        Decode.succeed Markup_ASC

                    "markup_DESC" ->
                        Decode.succeed Markup_DESC

                    "notes_ASC" ->
                        Decode.succeed Notes_ASC

                    "notes_DESC" ->
                        Decode.succeed Notes_DESC

                    "published_ASC" ->
                        Decode.succeed Published_ASC

                    "published_DESC" ->
                        Decode.succeed Published_DESC

                    "title_ASC" ->
                        Decode.succeed Title_ASC

                    "title_DESC" ->
                        Decode.succeed Title_DESC

                    "updatedAt_ASC" ->
                        Decode.succeed UpdatedAt_ASC

                    "updatedAt_DESC" ->
                        Decode.succeed UpdatedAt_DESC

                    _ ->
                        Decode.fail ("Invalid ChallengeOrderBy type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : ChallengeOrderBy -> String
toString enum =
    case enum of
        ActiveFrom_ASC ->
            "activeFrom_ASC"

        ActiveFrom_DESC ->
            "activeFrom_DESC"

        ActiveTo_ASC ->
            "activeTo_ASC"

        ActiveTo_DESC ->
            "activeTo_DESC"

        Answer_ASC ->
            "answer_ASC"

        Answer_DESC ->
            "answer_DESC"

        CreatedAt_ASC ->
            "createdAt_ASC"

        CreatedAt_DESC ->
            "createdAt_DESC"

        DiscussionUrl_ASC ->
            "discussionUrl_ASC"

        DiscussionUrl_DESC ->
            "discussionUrl_DESC"

        Id_ASC ->
            "id_ASC"

        Id_DESC ->
            "id_DESC"

        Markdown_ASC ->
            "markdown_ASC"

        Markdown_DESC ->
            "markdown_DESC"

        Markup_ASC ->
            "markup_ASC"

        Markup_DESC ->
            "markup_DESC"

        Notes_ASC ->
            "notes_ASC"

        Notes_DESC ->
            "notes_DESC"

        Published_ASC ->
            "published_ASC"

        Published_DESC ->
            "published_DESC"

        Title_ASC ->
            "title_ASC"

        Title_DESC ->
            "title_DESC"

        UpdatedAt_ASC ->
            "updatedAt_ASC"

        UpdatedAt_DESC ->
            "updatedAt_DESC"