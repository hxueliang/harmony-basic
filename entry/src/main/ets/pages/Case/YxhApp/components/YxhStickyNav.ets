@Component
export struct YxhStickyNav {
  @State currentIndex: number = 0
  @State arr: number[] = []

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
      this.arr.push(i)
    }
  }

  @Styles
  listCard() {
    .backgroundColor(Color.Pink)
    .height(72)
    .width("100%")
    .borderRadius(12)
  }

  @Builder
  getTabBarItem(title: string, index: number) {
    Text(title)
      .fontColor(this.currentIndex === index ? '#ed612b' : Color.Gray)
      .fontWeight(500)
      .fontSize(16)
  }

  build() {

    // Tabs
    Tabs({ index: $$this.currentIndex }) {
      TabContent() {
        List({ space: 10 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text("item" + item).fontSize(16)
            }.listCard()
          }, (item: string) => item)
        }
        .width("100%")
        .edgeEffect(EdgeEffect.Spring) // 边缘效应，设置为回弹
        // 调用来设置嵌套的滚动选项。
        .nestedScroll({
          scrollForward: NestedScrollMode.PARENT_FIRST, // 向前滚动时：父级可滚动组件优先级滚动响应
          scrollBackward: NestedScrollMode.SELF_FIRST // 向后滚动时：自已优先级滚动响应
        })
        .padding({ left: 10, right: 10 })
      }.tabBar(this.getTabBarItem('好房推介', 0))

      TabContent() {
      }.tabBar(this.getTabBarItem('商业地产', 1))

      TabContent() {
      }.tabBar(this.getTabBarItem('越秀星寓', 2))

      TabContent() {
      }.tabBar(this.getTabBarItem('越秀养老', 3))
    }
    .shadow({ radius: 5, color: Color.Gray })
    .margin({ top: 126 })
    .vertical(false)
    .backgroundColor(Color.White)
    .height("100%") // 设置 Tabs 的高度为 100%
  }

  @Builder
  testHead() {
    Text('吸顶').width('100%').height(40).backgroundColor(Color.Black).zIndex(999)
  }
}
