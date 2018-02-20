module Models exposing (Model, User, Task, UserId, Route(..), initialModel)
import RemoteData exposing (RemoteData(..), WebData)

type alias User = {
  id: UserId,
  name : String,
  email : String,
  level : Int,
  solvedTasks: List Task
}

type alias Task = {
  id: TypeId,
  title: String,
  description : String,
  answer : String
}

type alias Model = {
  points : Int,
  user : User,
  tasks : List Task,
  currentTask: Task,
  users: WebData (List User),
  authenticated: Bool,
  route: Route
}

type alias TypeId = Int

type alias UserId = Int

type Route
    = UsersRoute
    | UserRoute UserId
    | NotFoundRoute

initialModel : Route -> Model
initialModel route = {
  points = 0,
  user = { id = 2, name = "", email = "", solvedTasks = [], level = 1},
  tasks = [],
  currentTask = { id = 0, title = "", description = "", answer = ""},
  users = RemoteData.Loading,
  authenticated = False,
  route = route}
