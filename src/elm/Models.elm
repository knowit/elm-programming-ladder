module Models exposing (Model, initialModel)

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
  users: List(User),
  authenticated: Bool
}

initialModel : Model
initialModel = {
  points = 0,
  user = {name = "", email = "", solvedTasks = []},
  tasks = [],
  currentTask = { title = "", description = "", answer = ""},
  users = [],
  authenticated = False
  }
