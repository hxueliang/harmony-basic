@Entry
@Component
struct GridPage {
  private numberArray: number[] = [1, 2, 3, 4, 5]

  build() {
    Column() {
      Grid() {
        ForEach(this.numberArray, (row: number) => {
          ForEach(this.numberArray, (col: number) => {
            GridItem() {
              Text(`${row}-${col}`)
                .fontSize(16)
                .backgroundColor(0x999999)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
          }, (col: number) => col.toString())
        }, (row: number) => row.toString())
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .padding(10)
      .backgroundColor(0xCCCCCC)
      .width('94%')
      .height(300)
      .margin({ top: 50 })
    }
    .height('100%')
    .width('100%')
  }
}