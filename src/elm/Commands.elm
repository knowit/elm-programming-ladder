module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import Models exposing (User, Task)
import RemoteData


fetchUsers : Cmd Msg
fetchUsers =
    Http.get fetchUsersUrl usersDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchUsers


fetchUsersUrl : String
fetchUsersUrl =
    "/json/users.json"

usersDecoder : Decode.Decoder (List User)
usersDecoder =
    Decode.list userDecoder

userDecoder : Decode.Decoder User
userDecoder =
    decode User
        |> required "id" Decode.int
        |> required "name" Decode.string
        |> required "email" Decode.string
        |> required "level" Decode.int
        |> required "solvedTasks" tasksDecoder


tasksDecoder : Decode.Decoder (List Task)
tasksDecoder =
    Decode.list taskDecoder

taskDecoder : Decode.Decoder Task
taskDecoder =
  decode Task
      |> required "id" Decode.int
      |> required "title" Decode.string
      |> required "description" Decode.string
      |> required "answer" Decode.string
