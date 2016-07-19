module BarChart exposing
  (barChart, width, color)

{-|

# Bar Chart
@docs barChart

# Attrs
@docs width, color

-}

import List exposing (map)
import Svg exposing (Svg, Attribute, g, line)
import Svg.Attributes exposing (strokeWidth, stroke, x1, x2, y1, y2)
import Chart exposing (Datum, Data, Scale)


type alias BarProps =
  { x : Float
  , y1 : Float
  , y2 : Float
  }


type alias BarChartProps msg =
  { data : Data msg
  , xScale : Scale
  , yScale: Scale
  }


width : String -> Svg.Attribute msg
width = Svg.Attributes.strokeWidth


color : String -> Svg.Attribute msg
color = Svg.Attributes.stroke


bar : List (Svg.Attribute msg) -> BarProps -> Svg msg
bar attrs { x, y1, y2 } =
  Svg.line
    ([
      Svg.Attributes.x1 (toString x),
      Svg.Attributes.x2 (toString x),
      Svg.Attributes.y1 (toString y1),
      Svg.Attributes.y2 (toString y2),
      width "10",
      color "grey"
    ] ++ attrs)
    []


barChart : List (Svg.Attribute msg) -> (BarChartProps msg) -> Svg msg
barChart attrs { data, xScale, yScale } =
  g []
    (
      map
        (\(x, y, barAttrs) -> bar (attrs ++ barAttrs) { x = xScale(x), y1 = yScale(0), y2 = yScale(y) })
        data
    )
