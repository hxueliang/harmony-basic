@Entry
@Component
struct EllipsePage {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 20 }) {
      Ellipse({ width: 150, height: 80 })
      Ellipse()
        .height(80)
        .width(150)
        .fillOpacity(0.1)
        .strokeWidth(3)
        .stroke(Color.Red)
        .strokeDashArray([1, 2])
    }
    .height('100%')
    .width('100%')
    .margin({ top: 50 })
  }
}