@Entry
@Component
struct BuilderModifierCase {
  @State currentIndex: number = 0

  @State tabBarList: tabBarInterface[] = [{
    icon: $r("app.media.ic_public_message"),
    selectIcon: $r('app.media.ic_public_message_filled'),
    name: 'wechat',
    title: '微信',
  }, {
    icon: $r('app.media.ic_public_contacts_group'),
    selectIcon: $r('app.media.ic_public_contacts_group_filled'),
    name: 'connect',
    title: '联系人',
  }, {
    icon: $r('app.media.ic_gallery_discover'),
    selectIcon: $r('app.media.ic_gallery_discover_filled'),
    name: 'discover',
    title: '发现',
  }, {
    icon: $r('app.media.ic_public_contacts'),
    selectIcon: $r('app.media.ic_public_contacts_filled'),
    name: 'my',
    title: '我的',
  }]

  @Builder getTabBarItem(item: tabBarInterface, index: number) {
    Column({ space: 4 }) {
      Image(this.currentIndex === index ? item.selectIcon : item.icon)
        .width(20)
        .aspectRatio(1)
      Text(item.title)
        .fontColor(this.currentIndex === index ? Color.Green : Color.Gray)
    }
  }

  build() {
    Tabs({ barPosition: BarPosition.End, index: $$this.currentIndex }) {
      ForEach(this.tabBarList, (item: tabBarInterface, index) => {
        TabContent() {
          Column() {
            Text(index + '-' + this.currentIndex)
            Text()
            Text(item.title)
          }
        }.tabBar(this.getTabBarItem(item, index))
      })
    }
  }
}

interface tabBarInterface {
  icon: ResourceStr
  selectIcon: ResourceStr
  title: string
  name: string
}