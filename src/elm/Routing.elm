module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


route : Parser(Route -> a) a
route =
