module Msgs exposing (..)

import Models exposing (User)
import Navigation exposing (Location)
import RemoteData.Http

type Msg
    = OnFetchUsers (WebData (List User))
    | OnLocationChange Location
