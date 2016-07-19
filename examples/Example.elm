import Charts exposing (..)

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
    