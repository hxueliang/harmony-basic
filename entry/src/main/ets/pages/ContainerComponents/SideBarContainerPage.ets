@Entry
@Component
struct SideBarContainerPage {
  @State isShowSideBar: boolean = false;

  build() {
    SideBarContainer(SideBarContainerType.Embed) {
      Column() {
        Text('菜单1').fontSize(25)
        Text('菜单2').fontSize(25)
        Text('菜单3').fontSize(25)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .backgroundColor('#f0f0f0')

      Column() {
        Text('内容1').fontSize(20)
        Text('change isShowSideBar').fontSize(20).onClick(() => {
          this.isShowSideBar = !this.isShowSideBar
        })
        Text(this.isShowSideBar + '').fontSize(20)
      }
    }
    .padding({ top: 40 })
    .showSideBar($$this.isShowSideBar) // $$绑定状态，设置是否显示侧边栏。目前测试，设置该属性时，显示侧边栏时，会压缩内容区
  }
}