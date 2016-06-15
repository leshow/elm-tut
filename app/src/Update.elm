module Update exposing (..)

import Models exposing (Model)
import Messages exposing (Msg(..))
import Players.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PlayersMsg pmsg ->
            let
                ( pmodel, pcmd ) =
                    Players.Update.update pmsg model.players
            in
                ( { model | players = pmodel }, Cmd.map PlayersMsg pcmd )
