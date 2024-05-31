@Entry
@Component
struct NavPathStackDemo {
  list: NavItem[] = [
    { name: 'Chat', title: '聊天' },
    { name: 'Contacts', title: '联系人' },
    { name: 'Friend', title: '朋友圈' },
    { name: 'My', title: '我的' },
  ]

  build() {
    Navigation() {
      GridRow({ columns: 2 }) {
        ForEach(this.list, (item: NavItem) => {
          GridCol() {
            Text(item.title)
              .height('100%')
              .fontColor(Color.White)
          }
          .height(100)
          .backgroundColor(Color.Green)
          .margin(5)
          .borderRadius(8)
          .onClick(() => {
          })
        })
      }
      .padding(5)
    }
    .title("微信主页")
    .titleMode(NavigationTitleMode.Mini)
  }
}

interface NavItem {
  name: string
  title: string
}

