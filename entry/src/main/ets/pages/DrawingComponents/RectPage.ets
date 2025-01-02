@Entry
@Component
struct RectPage {
  build() {
    Column({ space: 20 }) {
      Rect({ width: '90%', height: 80 })
        .fill(Color.Pink)
        .stroke(Color.Transparent)

      Rect()
        .width('90%')
        .height(80)
        .fillOpacity(0)
        .stroke(Color.Red)
        .strokeWidth(3)

      Rect({ width: '90%', height: 80 })
        .radiusWidth(20)
        .radiusHeight(40)
        .fill(Color.Orange)
        .stroke(Color.Transparent)

      Rect({ width: '90%', height: 80 })
        .radiusWidth(40)
        .radiusHeight(20)
        .fill(Color.Orange)
        .stroke(Color.Transparent)

      Rect({ width: '90%', height: 80 })
        .radius(20)
        .fill(Color.Brown)
        .stroke(Color.Transparent)

      Rect({ width: '90%', height: 80 })
        .radius([[40, 40], [20, 20], [40, 40], [20, 20]])
        .fill(Color.Pink)
        .stroke(Color.Transparent)
    }
    .height('100%')
    .width('100%')
    .margin({ top: 50 })
  }
}