module Chart exposing (Datum, Data, Scale)

{-|

# Type
@docs Datum, Data, Scale

-}

import Svg exposing (Attribute)


type alias Datum msg = (Float, Float, List (Svg.Attribute msg))


type alias Data msg = List (Datum msg)


type alias Scale = Float -> Float
