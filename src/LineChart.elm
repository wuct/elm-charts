module LineChart exposing
  (lineChart, width, color)

{-|

# Line Chart
@docs lineChart

# Attrs
@docs width, color

-}

import List exposing (map, foldl)
import String exposing (dropRight)
import Svg exposing (Svg, g, path)
import Svg.Attributes exposing (strokeWidth, stroke, d, fill)
import Chart exposing (Data, Scale, ChartProps)


{-|-}
width : String -> Svg.Attribute msg
width =
  Svg.Attributes.strokeWidth


{-|-}
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


{-|-}
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
