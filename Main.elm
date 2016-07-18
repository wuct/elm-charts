module Main exposing (..)

import List exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)

type alias Coordinate = (Float, Float)
type alias Coordinates = List Coordinate
type alias Scale = Float -> Float

bar : Coordinate -> Svg line
bar (x, y) =
  line
    [
      x1 (toString x),
      x2 (toString x),
      y1 (toString 600),
      y2 (toString y),
      strokeWidth "10",
      stroke "red"
    ] []


barChart : { data : Coordinates, xScale : Scale, yScale: Scale  } -> List (Svg a)
barChart { data } =
  data
  |> map (\(x, y) -> (xScale(x), yScale(y)))
  |> map bar 


data : Coordinates
data = 
  [
    (1, 22.2),
    (2, 34),
    (3, 56),
    (4, 41)
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
      { data = data 
      , xScale = xScale
      , yScale = yScale
      }
    