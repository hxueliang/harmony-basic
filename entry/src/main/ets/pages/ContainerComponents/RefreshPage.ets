@Entry
@Component
struct RefreshPage {
  @State isRefreshing: boolean = true

  build() {
    Refresh({
      refreshing: $$this.isRefreshing,
      offset: 120,
      friction: 100
    }) {
      Column() {
        Text('下拉刷新').fontSize(30).margin(10)
        Text(this.isRefreshing + '')
      }
    }
    .height('100%')
    .width('100%')
    .margin({ top: 40 })
    .onRefreshing(() => {
      setTimeout(() => {
        this.isRefreshing = false
      }, 2000)
    })
  }
}