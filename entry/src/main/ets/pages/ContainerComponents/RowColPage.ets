@Entry
@Component
struct RowColPage {
  build() {
    Column({ space: 30 }) {
      Row({ space: 5 }) {
        ItemCom(1)
        ItemCom(2)
        ItemCom(3)
      }
      .width('100%')
      .height(250)
      .backgroundColor(Color.Gray)
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Center)

      Column({ space: 5 }) {
        ItemCom(1)
        ItemCom(2)
        ItemCom(3)
      }
      .width('100%')
      .height(350)
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
      .backgroundColor(Color.Grey)
    }
    .height('100%')
    .width('100%')

  }
}

@Builder
function ItemCom(num: number) {
  Row() {
    Text(num.toString()).fontSize(26)
  }
  .width(80)
  .aspectRatio(1)
  .backgroundColor(Color.Orange)
  .border({ width: 1 })
  .justifyContent(FlexAlign.Center)
}