import { YxhSwiper, YxhCardNav, YxhStickyNav } from './components'

@Entry
@Component
export struct HomeContent {
  scroller = new Scroller()

  build() {
    Scroll(this.scroller) {
      Column() {
        YxhSwiper()

        YxhCardNav()

        YxhStickyNav()
      }
    }
    .edgeEffect(EdgeEffect.Spring) // 边缘效应，设置为回弹
    .friction(0.6)
    .scrollBar(BarState.Off) // 关闭最外层滚动条
    .width('100%')
    .height('100%')
  }
}