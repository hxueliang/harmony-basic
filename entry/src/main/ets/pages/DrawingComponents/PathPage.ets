@Entry
@Component
struct PathPage {
  build() {
    Column({ space: 20 }) {
      // 绘制直线
      Path()
        .height(10)
        .commands('M0 0 L600 0')
        .stroke(Color.Black)
        .strokeWidth(3)

      // 绘制直线图形
      // 三角形
      Path()
        .commands('M100 0 L200 240 L0 240 Z')
        .fillOpacity(0)
        .stroke(Color.Black)
        .strokeWidth(3)

      // 正方形
      Path()
        .commands('M0 0 H200 V200 H0 Z')
        .fillOpacity(0)
        .stroke(Color.Black)
        .strokeWidth(3)

      // 五边形
      Path()
        .commands('M100 0 L0 80 L50 200 L150 200 L200 80 Z')
        .fillOpacity(0)
        .stroke(Color.Black)
        .strokeWidth(3)

      // 绘制弧线图形
      Path()
        .commands('M0 300 S100 0 240 300 Z')
        .fillOpacity(0)
        .stroke(Color.Black)
        .strokeWidth(3)

      Path()
        .commands('M0 150 C0 100 140 0 200 150 L100 300 Z')
        .fillOpacity(0)
        .stroke(Color.Black)
        .strokeWidth(3)

      Path()
        .commands('M0 100 A30 20 20 0 0 200 100 Z')
        .fillOpacity(0)
        .stroke(Color.Black)
        .strokeWidth(3)
    }
    .height('100%')
    .width('100%')
    .margin({ top: 50 })
  }
}