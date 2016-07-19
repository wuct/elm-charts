import Svg exposing (..)
import Svg.Attributes exposing (..)

type alias Datum msg = (Float, List msg)
type alias Data msg = List (Datum msg)

barChart : { data: Data msg, xScale: Float -> Float -> Float } -> Svg msg
barChart { data } =
  svg [] []

data =
  [
    (1.1, [])
  ]

foo =
  barChart { data = data, xScale = (\x y -> x + y) }

main =
  svg []
  [
    text (toString foo)
  ]
