import MTFoodItem from './MTFoodItem'

@Component
struct MTMain {
  @State
  menuList: string[] = ['一人套餐', '特色烧烤', '杂粮主食']
  @State
  currentMenuIndex: number = 0
  @State
  foodList: number[] = [1, 2, 3, 4, 5, 6, 7, 8]

  build() {
    Row() {
      List() {
        ForEach(this.menuList, (item: string, index: number) => {
          ListItem() {
            Text(item)
              .width('100%')
              .height(50)
              .textAlign(TextAlign.Center)
              .backgroundColor(
                this.currentMenuIndex === index ?
                $r('app.color.white') :
                Color.Transparent
              )
              .onClick(() => {
                this.currentMenuIndex = index
              })
          }
          .padding({
            bottom: index === this.menuList.length - 1 ? 80 : 0
          })
        })
      }
      .height('100%')
      .width(90)
      .backgroundColor($r('app.color.search_back_color'))

      List() {
        ForEach(this.foodList, (item: number, index: number) => {
          ListItem() {
            MTFoodItem()
          }
          .padding({
            bottom: index === this.foodList.length - 1 ? 80 : 0
          })
        })
      }
      .height('100%')
      .layoutWeight(1)
      .backgroundColor($r('app.color.white'))
    }
  }
}

export default MTMain