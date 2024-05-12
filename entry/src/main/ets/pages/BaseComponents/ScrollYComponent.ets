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

        Column() {

        }
        .width('100%')
        .height(this.middleHeight)
        .backgroundColor(Color.Yellow)

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