module LineChart exposing
  (lineChart, width, color)

{-|

# Line Chart
@docs lineChart

# Attributes
@docs width, color

-}

import List exposing (map, foldl)
import String exposing (dropRight)
import Svg exposing (Svg, g, path)
import Svg.Attributes exposing (strokeWidth, stroke, d, fill)
import Chart exposing (Data, Scale, ChartProps)


{-| Set line width.
-}
width : String -> Svg.Attribute msg
width =
  Svg.Attributes.strokeWidth


{-| Set line color.
-}
color : String -> Svg.Attribute msg
color =
  Svg.Attributes.stroke


creatPath : List (Float, Float) -> String
creatPath =
  List.foldl
    (\(x, y) path -> path ++ (toString x) ++ "," ++ (toString y) ++ "L")
    "M"
  >> String.dropRight 1


transformDataToCoordinatesByScale : Scale -> Scale -> Data msg -> List (Float, Float)
transformDataToCoordinatesByScale xScale yScale =
  List.map(\(x, y, _) -> (xScale(x), yScale(y)))


convertDataToPathByScale : Scale -> Scale -> Data msg -> String
convertDataToPathByScale xScale yScale data =
  transformDataToCoordinatesByScale xScale yScale data |> creatPath


{-| Create a line chart.

    import Svg exposing (svg)
    import Svg.Attributes exposing (width, height)
    import Chart exposing (Scale, Data)
    import LineChart exposing (lineChart, color, width)


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
          lineChart
            [
              LineChart.color "#9F7088",
              LineChart.width "10"
            ]
            { data = data
            , xScale = xScale
            , yScale = yScale
            }
        ]

-}
lineChart : List (Svg.Attribute msg) -> (ChartProps msg) -> Svg msg
lineChart attrs { data, xScale, yScale } =
  g []
    [
      path
        ([
          Svg.Attributes.d (convertDataToPathByScale xScale yScale data),
          Svg.Attributes.fill "transparent",
          width "2",
          color "grey"
        ] ++ attrs)
        []
    ]
