module Chart exposing (Datum, Data, Scale, ChartProps)

{-|

# Type
@docs Datum, Data, Scale, ChartProps

-}


import Svg exposing (Attribute)


{-| The first value is x-coordinate and the second value is y-coordinate.
The third value is a list of customized svg attributes.
-}
type alias Datum msg = (Float, Float, List (Svg.Attribute msg))


{-| List of Datum.

    import Svg.Attributes exposing (opacity)
    import Chart exposing (Data)
    import BarChart exposing (color)


    data : Data msg
    data =
      [
        (1, 22.2, []),
        (2, 34, []),
        (3, 56, [opacity "0.3"]),
        (4, 62, [color "#7F91B8"]),
        (5, 77, [])
      ]

-}
type alias Data msg = List (Datum msg)


{-| A function which maps a coordinate to a actual position in `<svg />`.
-}
type alias Scale = Float -> Float


{-| Props of charts.
-}
type alias ChartProps msg =
  { data : Data msg
  , xScale : Scale
  , yScale: Scale
  }
