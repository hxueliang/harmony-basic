@Entry
@Component
struct TabsPage {
  @State selectIndex: number = 0
  controller: TabsController = new TabsController()

  @Builder
  tabBuilder(index: number, name: string) {
    Column({ space: 5 }) {
      Text(name)
        .fontColor(this.selectIndex === index ? Color.Red : Color.Gray)
        .fontWeight(this.selectIndex === index ? 600 : 400)
      Divider()
        .strokeWidth(3)
        .width(24)
        .color(Color.Red)
        .opacity(this.selectIndex === index ? 1 : 0)
    }
  }

  build() {
    Column() {
      Tabs({
        barPosition: BarPosition.Start,
        controller: this.controller,
        index: $$this.selectIndex
      }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar(this.tabBuilder(0, 'Orange'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar(this.tabBuilder(1, 'Blue'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Red)
        }.tabBar(this.tabBuilder(2, 'Red'))
      }
      .vertical(false) // false: 横向Tabs, true: 纵向Tabs
      .barMode(BarMode.Fixed) // TabBar 布局模式
      .barWidth(360)
      .barHeight(56)
      .animationDuration(400) // TabContent 滑动动画时长
      .width('100%')
      .height(296)
      .margin({ top: 52 })
    }
    .height('100%')
    .width('100%')
  }
}