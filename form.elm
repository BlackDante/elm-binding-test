module Main exposing (..)

import Html exposing (div, form, input, span, text)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (onInput)

main : Program Never
main =
  beginnerProgram { model = model, view = view, update = update }


type alias Model =
  { firstname : String
  , lastname : String
  }


model : Model
model =
  { firstname = ""
  , lastname = ""
  }


type Msg = FirstNameUpdate String | LastNameUpdate String


view : Model -> Html.Html Msg
view model =
  div []
  [ form []
    [ input [ onInput FirstNameUpdate ] []
    , input [ onInput LastNameUpdate ] []
    ]
  , span [] [ text (name model) ]
  ]


update : Msg -> Model -> Model
update msg model =
  case msg of
    FirstNameUpdate content ->
      { model |
          firstname = content}

    LastNameUpdate content ->
      { model |
          lastname = content }


name : Model -> String
name model =
  "Fullname: " ++ model.firstname ++ " " ++ model.lastname
