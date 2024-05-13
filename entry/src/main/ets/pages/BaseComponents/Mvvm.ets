@Entry
@Component
struct Mvvm {
  @State isSelectCheckbox: Boolean = false

  build() {
    Grid() {
      GridItem() {
        Column() {
          Text('Checkbox')

          Checkbox()
            .select($$this.isSelectCheckbox)

          Text(this.isSelectCheckbox + '')

          Button('改值')
            .onClick(() => {
              this.isSelectCheckbox = !this.isSelectCheckbox
            })
        }
      }
      .backgroundColor(Color.Pink)
      .height(200)

      GridItem() {
        Column() {
          Text('Search')

          Search()

          Text('')

          Button('改值')
            .onClick(() => {
            })
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