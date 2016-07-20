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
    (3, 56, [BarChart.color "#AF86B4", ScatterPlot.size "10"]),
    (4, 62, []),
    (5, 77, [])
  ]


xScale : Scale
xScale x =
  20 + x * 100


yScale : Scale
yScale y =
  600 - y * 3


main =
  svg
    [
      Svg.Attributes.width "800",
      Svg.Attributes.height "600"
    ]
    [
      barChart
        [
          BarChart.color "#F4BDBC",
          BarChart.width "20"
        ]
        { data = data
        , xScale = xScale
        , yScale = yScale
        },
      lineChart
        [
          LineChart.color "#7E94C7",
          LineChart.width "4"
        ]
        { data = data
        , xScale = xScale
        , yScale = (\y -> 500 - y * 4)
        },
      scatterPlot
        [
          ScatterPlot.size "6",
          ScatterPlot.color "#D5B545"
        ]
        { data = data
        , xScale = xScale
        , yScale = (\y -> 400 - y * 4)
        }
    ]
