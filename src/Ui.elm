port module Ui exposing (..)

import Browser
import Element exposing (..)
import Element.Input as Input
import Html exposing (Html)



-- Port


port create : Int -> Cmd msg



-- Model


type alias Model =
    Int


init : () -> ( Model, Cmd msg )
init _ =
    ( 0
    , Cmd.none
    )



-- Update


type Msg
    = Create
    | Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        Create ->
            ( 1, create model )

        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( if model > 0 then
                model - 1

              else
                model
            , Cmd.none
            )



-- View


view : Model -> Html Msg
view model =
    Element.layout [ width fill, height fill ] <|
        column [ width fill, height fill ]
            [ row [ height fill, centerX, spacing 10 ]
                [ Input.button [ padding 10 ] { onPress = Just Decrement, label = text "-" }
                , text <| String.fromInt model
                , Input.button [ padding 10 ] { onPress = Just Increment, label = text "+" }
                ]
            , Input.button [ padding 10, centerX ] { onPress = Just Create, label = text "Create Rectangle" }
            ]



-- Main


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
