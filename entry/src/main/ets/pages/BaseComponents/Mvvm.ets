@Entry
@Component
struct Mvvm {
  build() {
    Grid() {
      GridItem() {
        Column() {
          Text('Checkbox')

          Checkbox()
        }
      }
      .backgroundColor(Color.Pink)
      .height(200)
    }
    .width('100%')
    .height('100%')
    .columnsTemplate('1fr 1fr')
    .columnsGap(20)
    .rowsGap(20)
  }
}