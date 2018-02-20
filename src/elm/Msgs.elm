module Msgs exposing (Msg(..))

import Models exposing (User)
import Navigation exposing (Location)
import RemoteData exposing (RemoteData(..), WebData)

type Msg
    = OnFetchUsers (WebData (List User))
    | OnLocationChange Location
