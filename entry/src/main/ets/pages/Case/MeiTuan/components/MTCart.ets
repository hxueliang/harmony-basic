import MTCartItem from './MTCartItem'

@Preview
@Component
struct MTCart {
  @Consume
  showCart: boolean
  @State
  list: number[] = [1, 2, 3, 4, 5]

  build() {
    Column() {
      Column() {
        Row() {
          Text('购物车')
            .fontWeight(FontWeight.Medium)
          Text('清空购物车')
            .fontColor($r('app.color.search_font_color'))
        }
        .width('100%')
        .height(50)
        .justifyContent(FlexAlign.SpaceBetween)

        List({ space: 25 }) {
          ForEach(this.list, (item: number) => {
            ListItem() {
              MTCartItem()
            }
          })
        }
        .height('60%')
      }
      .padding({
        left: 12,
        right: 12,
        bottom: 90,
      })
      .backgroundColor(Color.White)
      .borderRadius({
        topLeft: 10,
        topRight: 10,
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('rgba(0, 0, 0, 0.7)')
    .justifyContent(FlexAlign.End)
  }
}

export default MTCart