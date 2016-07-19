--module Charts exposing (..)

import List exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


type alias Datum msg = (Float, Float, List (Svg.Attribute msg))
type alias Data msg = List (Datum msg)
type alias Scale = Float -> Float


type alias BarProps =
  { x : Float
  , y1 : Float
  , y2 : Float
  }


bar : List (Svg.Attribute msg) -> BarProps -> Svg msg
bar attrs { x, y1, y2 } =
  Svg.line
    ([
      Svg.Attributes.x1 (toString x),
      Svg.Attributes.x2 (toString x),
      Svg.Attributes.y1 (toString y1),
      Svg.Attributes.y2 (toString y2),
      Svg.Attributes.strokeWidth "10",
      Svg.Attributes.stroke "grey"
    ] ++ attrs)
    []


type alias BarChartProps msg =
  { data : Data msg
  , xScale : Scale
  , yScale: Scale
  }


barChart : List (Svg.Attribute msg) -> (BarChartProps msg) -> List (Svg msg)
barChart attrs { data, xScale, yScale } =
  data
  |> map (\(x, y, barAttrs) -> bar (attrs ++ barAttrs) { x =xScale(x), y1 = yScale(0), y2 = yScale(y) })


data =
  [
    (1, 22.2, []),
    (2, 34, []),
    (3, 56, [Svg.Attributes.stroke "yellowgreen"]),
    (4, 41, [])
  ]


xScale : Scale
xScale x =
  x * 20


yScale : Scale
yScale y =
  600 - y * 3


main =
  svg
    [
      width "1000",
      height "600"
    ] <|
    barChart
      [
        Svg.Attributes.stroke "pink"
      ]
      { data = data
      , xScale = xScale
      , yScale = yScale
      }

