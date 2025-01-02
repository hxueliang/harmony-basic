@Entry
@Component
struct PolylinePage {
  build() {
    Column({ space: 20 }) {
      // 在 100*100 的矩形中绘制一段折线，起点为 (0, 0)，经过 (20, 60)，到达终点 (100, 100)
      Polyline({ width: 100, height: 100 })
        .points([[0, 0], [20, 60], [100, 100]])
        .fillOpacity(0)
        .stroke(Color.Blue)
        .strokeWidth(3)
        .backgroundColor('#f5f5f5')

      // 在 100*100 的矩形框中绘制一段折线，起点为 (20, 0)，经过 (0, 100)， 到达终点 (100, 90)
      Polyline()
        .width(100)
        .height(100)
        .fillOpacity(0)
        .stroke(Color.Red)
        .strokeWidth(1)
        .points([[20, 0], [0, 100], [100, 90]])
        .strokeLineJoin(LineJoinStyle.Round)// 设置折线拐角处为圆弧
        .strokeLineCap(LineCapStyle.Round)// 设置折线两端为半圆
        .backgroundColor('#f5f5f5')
    }
    .height('100%')
    .width('100%')
    .margin({ top: 50 })
  }
}