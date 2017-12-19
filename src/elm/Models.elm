module Models exposing (Model, initialModel)
import RemoteData exposing (RemoteData(..), WebData)

type alias User = {
  name : String,
  email : String,
  solvedTasks: List(Task)
}

type alias Task = {
  title: String,
  description : String,
  answer : String
}

type alias Model = {
  points : Int,
  user : User,
  tasks : List(Task),
  currentTask: Task,
  users: WebData (List User),
  authenticated: Bool
}

type alias PlayerId = Int

type Route
    = UsersRoute
    | UserRoute PlayerId
    | NotFoundRoute

initialModel : Route -> Model
initialModel route = {
  points = 0,
  user = {name = "", email = "", solvedTasks = []},
  tasks = [],
  currentTask = { title = "", description = "", answer = ""},
  users = Loading,
  authenticated = False,
  route = route}
