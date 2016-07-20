module ScatterPlot exposing
  (scatterPlot, size, color)

{-|

# Scatter Plot
@docs scatterPlot

# Attributes
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


{-| Set dot size.
-}
size : String -> Svg.Attribute msg
size =
  Svg.Attributes.r


{-| Set dot color.
-}
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


{-| Create a scatter plot.

    import Svg exposing (svg)
    import Svg.Attributes exposing (width, height)
    import Chart exposing (Scale, Data)
    import ScatterPlot exposing (scatterPlot, color, size)


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
          scatterPlot
            [
              ScatterPlot.color "#9F7088",
              ScatterPlot.size "4"
            ]
            { data = data
            , xScale = xScale
            , yScale = yScale
            }
        ]

-}
scatterPlot : List (Svg.Attribute msg) -> (ChartProps msg) -> Svg msg
scatterPlot attrs { data, xScale, yScale } =
  g []
    (
      map
        (\(x, y, dotAttrs) -> dot (attrs ++ dotAttrs) { x = xScale(x), y = yScale(y) })
        data
    )
