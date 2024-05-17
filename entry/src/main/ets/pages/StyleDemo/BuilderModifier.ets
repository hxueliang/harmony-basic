@Entry
@Component
struct BuilderModifier {
  build() {
    Column() {
      Row() {
        Text('A. 选项')
      }
      .backgroundColor('#ddd')
      .borderRadius(8)
      .width('100%')
      .height(40)
      .padding({
        right: 20,
        left: 20,
      })
    }
    .padding(20)
  }
}