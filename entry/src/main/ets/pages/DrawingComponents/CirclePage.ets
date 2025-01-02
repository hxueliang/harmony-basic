@Entry
@Component
struct CirclePage {
  build() {
    Column({ space: 20 }) {
      Circle().width(150).height(150)
      Circle()
        .width(150)
        .height(200)
        .fillOpacity(0.1)// 设置填充区域透明度
        .strokeWidth(3)// 设置边框宽度
        .stroke(Color.Red)// 设置边框颜色
        .strokeDashArray([10, 5, 10, 1]) // 设置边框间隙
    }
    .height('100%')
    .width('100%')
    .margin({ top: 50 })
  }
}