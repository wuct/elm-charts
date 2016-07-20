module BarChart exposing
  (barChart, width, color)

{-|

# Bar Chart
@docs barChart

# Attributes
@docs width, color

-}

import List exposing (map)
import Svg exposing (Svg, Attribute, g, line)
import Svg.Attributes exposing (strokeWidth, stroke, x1, x2, y1, y2)
import Chart exposing (Data, Scale, ChartProps)


type alias BarProps =
  { x : Float
  , y1 : Float
  , y2 : Float
  }


{-| Set bar width.
-}
width : String -> Svg.Attribute msg
width =
  Svg.Attributes.strokeWidth


{-| Set bar color.
-}
color : String -> Svg.Attribute msg
color =
  Svg.Attributes.stroke


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


{-| Create a bar chart.

    import Svg exposing (svg)
    import Svg.Attributes exposing (width, height)
    import Chart exposing (Scale, Data)
    import BarChart exposing (barChart, color, width)


    data : Data msg
    data =
      [
        (1, 22.2, []),
        (2, 34, []),
        (3, 56, []),
        (4, 62, []),
        (5, 77, [])
      ]


    xScale : Scale
    xScale x =
      20 + x * 20


    yScale : Scale
    yScale y =
      400 - y * 3


    main =
      svg
        [
          Svg.Attributes.width "600",
          Svg.Attributes.height "400"
        ]
        [
          barChart
            [
              BarChart.color "#9F7088",
              BarChart.width "10"
            ]
            { data = data
            , xScale = xScale
            , yScale = yScale
            }
        ]

-}
barChart : List (Svg.Attribute msg) -> (ChartProps msg) -> Svg msg
barChart attrs { data, xScale, yScale } =
  g []
    (
      map
        (\(x, y, barAttrs) -> bar (attrs ++ barAttrs) { x = xScale(x), y1 = yScale(0), y2 = yScale(y) })
        data
    )
