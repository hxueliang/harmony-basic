@Entry
@Component
struct BuilderParamModifierDialog {
  build() {
    Column({ space: 20 }) {
      ModelDialog()
    }
    .backgroundColor("#ddd")
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct ModelDialog {
  build() {
    Column() {
      Column() {
        // header
        Column() {

        }
        // body
        Column() {

        }
        Row({ space: 10 }) {
          Button('确定')
          Button('取消')
        }
        .width('100%')
        .justifyContent(FlexAlign.End)
      }
      .width('100%')
      .backgroundColor('#fff')
      .borderRadius(8)
      .padding(10)
    }
    .padding({ right: 20, left: 20 })
  }
}