module Page.Challenge exposing (..)

{- Challenge page, dynamic page to show one challenge.

   The idea of this page is to fetch challenges and display the individual challenges, and validate answers for the challenge.
   Before this is done session management should be in place, to save user progress.

   A suggestion for adding more functionality was to have multiple different questions for one challenge,
   and distribute the different challenges to the users, so that they would have similar questions but different answers.
   e.g. (user1 gets 5+5, user2 gets 2+4, ...) which would produce different answers (user1 = 10, user2 = 6, ...)
-}
