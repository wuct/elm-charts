import Svg exposing (svg)
import Svg.Attributes exposing (width, height)
import Chart exposing (Scale, Data)
import BarChart exposing (barChart, color, width)
import LineChart exposing (lineChart, color, width)
import ScatterPlot exposing (scatterPlot, color, size)


data : Data msg
data =
  [
    (1, 22.2, []),
    (2, 34, []),
    (3, 56, [BarChart.color "yellowgreen"]),
    (4, 62, []),
    (5, 77, [])
  ]


xScale : Scale
xScale x =
  20 + x * 20


yScale : Scale
yScale y =
  600 - y * 3


main =
  svg
    [
      Svg.Attributes.width "1000",
      Svg.Attributes.height "600"
    ]
    [
      barChart
        [
          BarChart.color "pink",
          BarChart.width "10"
        ]
        { data = data
        , xScale = xScale
        , yScale = yScale
        },
      lineChart
        [
          LineChart.color "#7E94C7"
        ]
        { data = data
        , xScale = xScale
        , yScale = (\y -> 500 - y * 3)
        },
      scatterPlot
        []
        { data = data
        , xScale = xScale
        , yScale = (\y -> 400 - y * 3)
        }
    ]
