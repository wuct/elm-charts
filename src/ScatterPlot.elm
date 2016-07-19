module ScatterPlot exposing
  (scatterPlot, size, color)

{-|

# Scatter Plot
@docs scatterPlot

# Attrs
@docs size, color

-}


import List exposing (map)
import Svg exposing (Svg, Attribute, g, circle)
import Svg.Attributes exposing (fill, cx, cy, r)
import Chart exposing (Data, Scale, ChartProps)


type alias DotProps =
  { x : Float
  , y : Float
  }


{-|-}
size : String -> Svg.Attribute msg
size =
  Svg.Attributes.r


{-|-}
color : String -> Svg.Attribute msg
color =
  Svg.Attributes.fill


dot : List (Svg.Attribute msg) -> DotProps -> Svg msg
dot attrs { x, y } =
  Svg.circle
    ([
      Svg.Attributes.cx (toString x),
      Svg.Attributes.cy (toString y),
      size "4",
      color "grey"
    ] ++ attrs)
    []


{-|-}
scatterPlot : List (Svg.Attribute msg) -> (ChartProps msg) -> Svg msg
scatterPlot attrs { data, xScale, yScale } =
  g []
    (
      map
        (\(x, y, dotAttrs) -> dot (attrs ++ dotAttrs) { x = xScale(x), y = yScale(y) })
        data
    )
