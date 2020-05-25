module Core.Style exposing (Style,menuTabButtonSelected,menuTabButton, menuButton, menuButtonSelected, menuIconButton, sheetButton, sheetButtonSelected)

import Element exposing (Attribute, Element)
import Element.Input as Input
import Html exposing (Html)


type alias Style msg =
    { snackbar : List (Attribute msg)
    , layout : List (Attribute msg) -> Element msg -> Html msg
    , header : List (Attribute msg)
    , sheet : List (Attribute msg)
    , menuButton : List (Attribute msg)
    , menuButtonSelected : List (Attribute msg)
    , sheetButton : List (Attribute msg)
    , sheetButtonSelected : List (Attribute msg)
    , tabButton : List (Attribute msg)
    , tabButtonSelected : List (Attribute msg)
    , menuIcon : Element Never
    , moreVerticalIcon : Element Never
    , spacing : Int
    }


menuButtonSelected : Style msg -> { label : String, icon : Element Never, onPress : Maybe msg } -> Element msg
menuButtonSelected config { label, icon, onPress } =
    Input.button (config.menuButton ++ config.menuButtonSelected)
        { onPress = onPress
        , label =
            Element.row [ Element.spacing 8 ]
                [ icon |> Element.map never
                , Element.text label
                ]
        }


menuButton : Style msg -> { label : String, icon : Element Never, onPress : Maybe msg } -> Element msg
menuButton config { label, icon, onPress } =
    Input.button config.menuButton
        { onPress = onPress
        , label =
            Element.row [ Element.spacing 8 ]
                [ icon |> Element.map never
                , Element.text label
                ]
        }


menuIconButton : Style msg -> { label : String, icon : Element Never, onPress : Maybe msg } -> Element msg
menuIconButton config { label, icon, onPress } =
    Input.button config.menuButton
        { onPress = onPress
        , label = icon |> Element.map never
        }


sheetButton : Style msg -> { label : String, icon : Element Never, onPress : Maybe msg } -> Element msg
sheetButton config { label, icon, onPress } =
    Input.button config.sheetButton
        { onPress = onPress
        , label =
            Element.row [ Element.spacing 8 ]
                [ icon |> Element.map never
                , Element.text label
                ]
        }


sheetButtonSelected : Style msg -> { label : String, icon : Element Never, onPress : Maybe msg } -> Element msg
sheetButtonSelected config { label, icon, onPress } =
    Input.button (config.sheetButton ++ config.sheetButtonSelected)
        { onPress = onPress
        , label =
            Element.row [ Element.spacing 8 ]
                [ icon |> Element.map never
                , Element.text label
                ]
        }

menuTabButton : Style msg -> { label : String, icon : Element Never, onPress : Maybe msg } -> Element msg
menuTabButton config { label, icon, onPress } =
    Input.button (config.menuButton ++ config.tabButton)
        { onPress = onPress
        , label =
            Element.row [ Element.spacing 8 ]
                [ icon |> Element.map never
                , Element.text label
                ]
        }

menuTabButtonSelected : Style msg -> { label : String, icon : Element Never, onPress : Maybe msg } -> Element msg
menuTabButtonSelected config { label, icon, onPress } =
    Input.button (config.menuButton ++ config.tabButton ++ config.tabButtonSelected)
        { onPress = onPress
        , label =
            Element.row [ Element.spacing 8 ]
                [ icon |> Element.map never
                , Element.text label
                ]
        }