@Entry
@Component
struct ScrollYComponent {
  @State middleHeight: number = 0

  build() {
    Column() {
      Row()
        .width('100%')
        .height(60)
        .backgroundColor(Color.Orange)
      Scroll() {
        Column() {
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
        }
      }
      .width('100%')
      .height(this.middleHeight)
      Row()
        .width('100%')
        .height(60)
        .backgroundColor(Color.Orange)
    }
    .height('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .onAreaChange((oldValue: Area, newValue: Area) => {
      console.log(JSON.stringify(newValue))
      this.middleHeight = (newValue.height as number) - (60 * 2)
    })
  }
}

@Component
struct ScrollItem {
  build() {
    Row() {
      Text('item')
        .width('100%')
        .fontSize(30)
        .textAlign(TextAlign.Center)
    }
    .height(100)
    .margin({ top: 20, left: 20, right: 20 })
    .backgroundColor(Color.Yellow)
    .borderRadius(6)
  }
}