module Page.About exposing (viewAbout)

{- About page, static page, content is from the original programming ladder

   This page (as well as the Home page) is static as it currently have no functionality except displaying text.
   Examples of dynamic pages are Stats and Challenges
-}

import Html exposing (..)
import Html.Attributes exposing (..)


viewAbout : Html msg
viewAbout =
    div [ class "content-main" ]
        [ div [ class "content" ]
            [ h2 [] [ text "Om Kodekalenderen" ]
            , text """Kodekalenderen er kalenderen for deg som er glad i programmering. Hver luke er en oppgave som løses best ved hjelp av kode.
    Lukene varierer i vanskelighetsgrad og utforming, men felles for alle er at koden til løsningen din skal resultere i et svar på en linje som systemet kan sjekke om er korrekt.
    Hver luke som løses er et lodd i trekningen av en telefon eller et nettbrett. Løs så mange luker som mulig for å øke vinnersjansene dine!
    Lukene åpnes klokken 06:00 hver dag, og du har 24 timer på på å løse oppgaven.
    Vinneren trekkes på nyåret og vil bli kontaktet. Lykke til og god jul!"""
            ]
        , div [ class "content" ]
            [ h2 [] [ text "Stack" ]
            , text "Elm"
            ]
        , div [ class "content" ]
            [ h2 [] [ text "Om Knowit" ]
            , text """Knowit-kulturen er bygget på åpenhet, entreprenørskap, høy kompetanse, en vilje til stadig å utvikles - og en god dose nerdehumor. 
            Vi er nesten 2200 ansatte fordelt på Norge, Sverige, Danmark, Finland og Tyskland. 
            I Norge finnes vi i Oslo, Bergen, Stavanger, Kristiansand, Arendal og Trondheim."""
            , a [ href "https://www.knowit.no/karriere/" ] [ text "Lyst på jobb?" ]
            ]
        ]
