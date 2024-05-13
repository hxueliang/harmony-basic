@Entry
@Component
struct Mvvm {
  @State isSelectCheckbox: Boolean = false
  @State searchValue: String = ''

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

          Search({
            value: $$this.searchValue
          })

          Text(this.searchValue + '')

          Button('改值')
            .onClick(() => {
              this.searchValue += "0"
            })
        }
      }
      .backgroundColor(Color.Pink)
      .height(200)

      GridItem() {
        Column() {
          Text('TextInput')

          TextInput()

          Text('')

          Button('改值')
            .onClick(() => {
            })
        }
      }
      .backgroundColor(Color.Pink)
      .height(200)

      GridItem() {
        Column() {
          Text('TextArea')

          TextArea()
            .maxLength(5)

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