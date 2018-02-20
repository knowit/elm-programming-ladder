module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (UserId, Route(..))
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map UsersRoute top
        , map UserRoute (s "users" </> int)
        , map UsersRoute (s "users")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
