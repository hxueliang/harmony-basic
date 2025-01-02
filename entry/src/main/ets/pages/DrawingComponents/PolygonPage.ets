@Entry
@Component
struct PolygonPage {
  build() {
    Column({ space: 20 }) {
      Text('Polygon')

      // 在 100*100 的矩形框中绘制一个三角形，起点为(0, 0)，经过(50, 100)，到达终点(100, 0)
      Polygon({ width: 100, height: 100 })
        .points([[0, 0], [50, 100], [100, 0]])
        .fill(Color.Green)
        .stroke(Color.Transparent)

      // 在 100*100 的矩形框中绘制一个四边形，起点为(0, 0)，经过(0, 100)和(100, 100)，到达终点(100, 0)
      Polygon()
        .width(100)
        .height(100)
        .points([[0, 0], [0, 100], [100, 100], [100, 0]])
        .fillOpacity(0)
        .strokeWidth(5)
        .stroke(Color.Blue)

      // 在 100*100 的矩形框中绘制一个五边开，起点为(50, 0)，依次经过(0, 50)、(20, 100)和(80, 100)，到达终点(100, 50)
      Polygon()
        .width(100)
        .height(100)
        .points([[50, 0], [0, 40], [20, 100], [80, 100], [100, 40]])
        .fill(Color.Red)
        .fillOpacity(0.6)
        .stroke(Color.Transparent)
    }
    .height('100%')
    .width('100%')
    .margin({ top: 50 })
  }
}