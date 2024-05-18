@Entry
@Component
struct BuilderParamModifier {
  build() {
    Column({ space: 20 }) {
      Card()
      Card()
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct Card {
  build() {
    Column() {
      Column() {

      }
      .width('100%')
      .height('100')
      .backgroundColor('#ccc')
      .borderRadius(8)
    }
    .padding({ right: 20, left: 20 })
  }
}