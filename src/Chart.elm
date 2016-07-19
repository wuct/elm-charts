module Chart exposing (Datum, Data, Scale, ChartProps)

{-|

# Type
@docs Datum, Data, Scale, ChartProps

-}

import Svg exposing (Attribute)


type alias Datum msg = (Float, Float, List (Svg.Attribute msg))


type alias Data msg = List (Datum msg)


type alias Scale = Float -> Float

type alias ChartProps msg =
  { data : Data msg
  , xScale : Scale
  , yScale: Scale
  }
