## Info

The graphcool server-part of this repo is imported from the previous programming ladder. To this point, that part remains unchanged.
The elm frontend is then designed to work on top of that existing backend.

## Git repo structure

The structure of this repo (branches etc.) follows this [branching model](https://nvie.com/posts/a-successful-git-branching-model/)

## Setup
- **If you do not have an account at Graphcool**: [Register for Graphcool](https://console.graph.cool/login)
- [Install Docker](https://docs.docker.com/install/)
- [Install Elm](http://elm-lang.org/install)
- [Install Node](https://nodejs.org/en/download/)
- [Install Yarn](https://yarnpkg.com/)

Install node packages:

```
yarn
```

### Back-End Setup

- Install dependencies for the server: `cd ladder/server && yarn && graphcool local up`
- Gå to the page for [authentication for the Graphcool-project](https://console.graph.cool/Programming%20Ladder/settings/authentication), copy the authentication command (should look like this: `graphcool login —token $TOKEN`) and run this.
- Start developing with `graphcool deploy --target my-dev`
  _ If you get no errormessages (see below), choose `shared-eu-west-1` in the menu that pops up. You'll be prompted to enter a name for the service. Name it `my-dev` (or something else; it doesn't matter that much).
  _ **I get the error-message `Cannot read property 'viewer' of undefined`:** Open `ladder/server/.graphcoolrc` if the file exists. Probably you've got a line in the file that begins with `local:`. Delete this line and repeat the command above.

* Now you'll find the admin-interface for this instanse of Graphcool under [the project `my-dev` on your Graphcool-console](https://console.graph.cool/eiriks-dev/).
* On the end of the text that pops up there is a list of URLs. Copy the URL after `Simple API:`.
* Go to the client part of the project and find the `Main.elm` file and replace the value of the API reference with the `Simple API`-URL you got from the previous step.

## Running the BACKEND

GraphQL as a service, [Graphcool](https://www.graph.cool/)

```bash
$ cd server
$ graphcool deploy --target prod
```

## Running the elm-application:

In terminal run:

```
yarn start
```

Open `http://localhost:8000`


## Useful links

Simple Elm SPA examples:
- https://github.com/sporto/elm-tutorial-app
- https://github.com/malaire/elm-examples/blob/master/spa-basic/src/Main.elm

Complex Elm SPA examples
- https://github.com/rtfeldman/elm-spa-example
- https://github.com/elm/package.elm-lang.org
